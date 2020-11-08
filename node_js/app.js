var app = require('express')();
var http = require('http').Server(app);
var mysql = require('mysql');
var io = require('socket.io')(http);

const {TwingEnvironment, TwingLoaderFilesystem} = require('twing');
let loader = new TwingLoaderFilesystem('public/templates');
let twing = new TwingEnvironment(loader);

// At the top of your server.js
process.env.PWD = process.cwd();
// Then
var express= require('express');
app.use(express.static(process.env.PWD + '/public/images'));

// Add headers
app.use(function (req, res, next) {

    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', 'http://localhost:8080');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    next();
});

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "cricket",
  multipleStatements:true
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Database Connected!");
});
 
io.on('connection', function(socket){
  console.log('Client connection received');
   
  socket.emit('msg_from_server', { hello: 'world' });
   /*
  socket.on('receivedFromClient', function (data) {
      console.log(data);
  });
  */
});
 
app.get('/', function(req, res){
	    res.setHeader('Access-Control-Allow-Origin', 'http://localhost:8080');

    res.sendFile(__dirname + '/index.html');
});

app.get('/client', function(req, res){
  res.sendFile(__dirname + '/public/client.html');
});

app.get('/updatescore', function(req, res){
  var score = Math.random();
  io.emit('msg_from_server', {'score' : score});
  res.send("WHEEE");
});

app.get('/panelShow', function(req, res){
	var match_id=req.query.match_id;
	
	con.query("SELECT * FROM csn_scorebook", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
});	

app.get('/updateui', function(req, res){
  var param_obj = {};
  param_obj.panel_name = req.query.panel_name;
  param_obj.match_id = req.query.match_id;
  param_obj.player_id = req.query.player_id;
 // console.log('panel_name' + panel_name);
  io.emit('updateui', param_obj);
  res.send("UI CHANGES");
  
});

//---- Temmplate function ---
app.get('/inningscard', function (req, res) {
  var match_id = req.query.match_id;
  var innings =  req.query.innings;
  
  app.set('view engine', 'twig');
  var batsman_list = [];
  var sql_batsman='select bt.player_name,'+
      'CASE WHEN BT.IS_OUT=1 THEN '+
		'(SELECT CASE WHEN cs.wicket_type=\'Bowled\' THEN'+
		'			concat(\'b \',cs.bowler)'+
         '           WHEN cs.wicket_type=\'Caught\' THEN'+
          '          concat(\'c \',cs.fielder,\' b \',cs.bowler)'+
           '         WHEN cs.wicket_type=\'Run Out\' THEN'+
            '        concat(\'run out (\',cs.fielder,\'-\',cs.bowler,\')\')'+
             '       WHEN cs.wicket_type=\'Stumping\' THEN '+
              '      concat(\'st (\',cs.fielder,\'-\',cs.bowler,\')\') '+
               '     WHEN cs.wicket_type=\'LBW\' THEN '+
                '    concat(\'lbw \',cs.bowler) '+
                 '    WHEN cs.wicket_type=\'Hit Wicket\' THEN '+
                  '   \'Hit Wicket\''+
       ' ELSE cs.bowler  '+
        ' END '+
        ' FROM csn_scorebook cs'+
        ' where cs.match_id=bt.match_uuid'+
        ' and cs.player_out=bt.player_name)'+
    ' ELSE'+
    ' \'Not Out\' END wicket_type,'+
  'bt.runs,bt.balls,fours,sixes,bt.strike_rate from csn_batsman_match_dtls bt where match_uuid=?  and innings=? order by uuid;';
  //var sql_first_inn_score=";select concat(m.first_innings_runs,\'-\',m.first_innings_wickets) first_inn from csn_match m where m.uuid=?";
  var sql_match_extra="select concat('(',GROUP_CONCAT(x.extra_type,x.extra_runs SEPARATOR ', '),')') extras,sum(x.extra_runs) extra_runs from csn_match_extras x where x.match_uuid=? and x.innings=?;";
  
  var sql_total='select y.*,ROUND(y.score / y.ACTUAL_OVERS,2) runrate from (SELECT   x.*, x.score / x.overs runrate,CASE WHEN SUBSTRING_INDEX(SUBSTRING_INDEX(x.balls,\'.\',2),\'.\',-1)=60 THEN x.OVERS ELSE x.BALLS END ACTUAL_OVERS FROM ( SELECT CASE WHEN ? = 1 THEN m.first_innings_runs ELSE m.second_innings_runs END score, CASE WHEN ? = 1 THEN m.first_innings_wickets ELSE m.second_innings_wickets END wickets, (SELECT  MAX(cs.ball) curr_overs FROM csn_scorebook cs WHERE cs.match_id = m.uuid AND cs.innings = ?) balls, (SELECT  MAX(cs.overs) curr_overs FROM csn_scorebook cs WHERE cs.match_id = m.uuid AND cs.innings = ?) overs FROM csn_match m WHERE m.uuid = ?) x) y;';
  
  var sql_bowling='select * from csn_bowler_match_dtls where match_uuid=? and innings=?;'
  var sql = sql_batsman+sql_match_extra+sql_total+sql_bowling; 
  
  
  
  console.log(sql);
  con.query(sql,[match_id,innings,match_id,innings,innings,innings,innings,innings,match_id,match_id,innings], function (err, results, fields) {
    if (err) throw err;
	console.log(results[0]);
	twing.render('inningscard.twig', {'batsman_list': results[0],'extras_list':results[1],'total_list':results[2],'bowler_list':results[3]}).then((output) => {
      res.end(output);
  });
  }); 
  
});
 
app.get('/scorecard', function (req, res) {
	var match_id = req.query.match_id;
	var innings =  req.query.innings;
	app.set('view engine', 'twig');
	var sql_match = 'select (select t.name from csn_team t where uuid=m.team1_uuid) team1_name,(select t.name from csn_team t where uuid=m.team2_uuid) team2_name from csn_match m where m.uuid=?;';
	var sql_curr_inn_score = 'select score,wickets,(select name from csn_team where uuid=team_uuid) team from (SELECT CASE WHEN ? = 1 THEN m.first_innings_runs ELSE m.second_innings_runs END score,CASE WHEN ? = 1 THEN m.first_innings_wickets ELSE m.second_innings_wickets END wickets,CASE WHEN ? = 1 THEN m.first_innings_team_uuid ELSE m.second_innings_team_uuid END team_uuid from csn_match m where m.uuid=?) x;';
	var sql_last_balls = 'select concat(cs.total_runs,cs.extra_type) runs from csn_scorebook cs where cs.match_id=? and cs.innings = ? order by uuid limit 0,10;';
	var sql_first_inn_score = 'SELECT m.first_innings_runs score,m.first_innings_wickets wickets,(select t.name from csn_team t where t.uuid=m.first_innings_team_uuid) team from csn_match m where m.uuid=? and  m.current_inning = 2 ;';
	var sql_batsman_score = 'select bt.player_name,bt.runs,bt.balls from csn_batsman_match_dtls bt where match_uuid=? and bt.innings=? and is_out=0;';
	var sql_bowler = 'select bw.player_name,bw.wickets,bw.runs,bw.overs,bw.balls,bw.economy_rate,bw.no_ball,bw.wide from csn_bowler_match_dtls bw where bw.match_uuid=? and bw.player_name in (select cs.bowler from csn_scorebook cs where cs.uuid =(select max(c.uuid) from csn_scorebook c where c.match_id=?));';
	var sql_overs = 'SELECT CASE WHEN SUBSTRING_INDEX(SUBSTRING_INDEX(max(cs.ball), \'.\', 2), \'.\', - 1) = 60 THEN max(cs.OVERS) ELSE max(cs.BALL) END ACTUAL_OVERS FROM csn_scorebook cs WHERE cs.match_id = ? AND cs.innings = ?;';
	
	
	var sql = sql_match+sql_curr_inn_score+sql_last_balls+sql_first_inn_score+sql_batsman_score+sql_bowler+sql_overs;
	//console.log(sql);
	
	con.query(sql,[match_id,innings,innings,innings,match_id,match_id,innings,match_id,match_id,innings,match_id,match_id,match_id,innings], function (err, results, fields) {
    if (err) throw err;
	twing.render('scorecard.twig', {'match_list': results[0],'score_list':results[1],'last_balls_list':results[2],'first_inn_list':results[3]
	,'batsman_list':results[4],'bowler_list':results[5],'over_list':results[6]}).then((output) => {
      res.end(output);
  });
  }); 
  
});

app.get('/tosscard', function (req, res) {
  var match_id = req.query.match_id;
  
  var sql_toss = 'select (select name from csn_team t where t.uuid=m.toss_winner_uuid) team,m.toss_decision from csn_match m where uuid= ?;';
  
  con.query(sql_toss,match_id, function (err, result, fields) {
    if (err) throw err;
	twing.render('tosscard.twig', {'toss_details': result}).then((output) => {
      res.end(output);
  });
  
  }); 
}); 

app.get('/squadcard', function (req, res) {
  var match_id = req.query.match_id;
  
  var sql_first_batting ='select * from csn_team_players cp inner join csn_player p on cp.player_uuid=p.uuid where cp.team_uuid in (select m.first_innings_team_uuid from csn_match m where m.uuid=?);';
  var sql_second_batting ='select * from csn_team_players cp inner join csn_player p on cp.player_uuid=p.uuid where cp.team_uuid in (select m.second_innings_team_uuid from csn_match m where m.uuid=?);';	
  
  sql = sql_first_batting + sql_second_batting;
  con.query(sql,[match_id,match_id], function (err, results, fields) {
    if (err) throw err;
	twing.render('squadcard.twig', {'first_details': results[0],'second_details': results[1]}).then((output) => {
      res.end(output);
  });
  
  }); 
}); 
  

app.get('/playercard', function (req, res) {
  var player_id = req.query.player_id;

  var sql_player = 'select p.*,DATE_FORMAT(p.dob,\'%d-%M-%Y\') dob_format from csn_player p where uuid=?;';
  var sql_batting = 'select * from csn_career_batting_dtls where player_uuid = ?;';
  
  var sql_bowling = 'select * from csn_career_bowling_dtls where player_uuid = ?;';

	sql	 = sql_player + sql_batting + sql_bowling;
	
  con.query(sql,[player_id,player_id,player_id], function (err, results, fields) {
    if (err) throw err;
	
	twing.render('playercard.twig', {'player_details': results[0],'batting_details': results[1],'bowling_details': results[2]}).then((output) => {
      res.end(output);
  });
  
  }); 
}); 


app.get('/batsmanmatchcard', function (req, res) {
  var player_id = req.query.player_id;
  var sql = 'select * from csn_batsman_match_dtls where player_uuid = ?;';
  
    con.query(sql,player_id, function (err, result, fields) {
    if (err) throw err;
	twing.render('batsmanmatchcard.twig', {'batsman_details': result}).then((output) => {
      res.end(output);
  });
  
  }); 
  
}); 

app.get('/bowlermatchcard', function (req, res) {
  var player_id = req.query.player_id;
  var sql = 'select * from csn_bowler_match_dtls where player_uuid = ?;';
  
    con.query(sql,player_id, function (err, result, fields) {
    if (err) throw err;
	twing.render('bowlermatchcard.twig', {'bowler_details': result}).then((output) => {
      res.end(output);
  });
  
  }); 
}); 

app.get('/batsmanseriescard', function (req, res) {
  var player_id = req.query.player_id;
  var tournament_id = req.query.tournament_id;
  
  var sql = ' select cb.player_uuid,cb.player_name,count(cb.match_uuid) matches,'+
			' count(cb.match_uuid)-sum(cb.is_out) not_outs,sum(cb.runs) runs,max(cb.runs) max_score,'+
			' case when sum(cb.is_out)=0 then sum(cb.runs) else round(sum(cb.runs)/sum(cb.is_out),2)  end average,'+
			' sum(cb.balls) balls_faced,round((sum(cb.runs) *100)/sum(cb.balls),2) sr,'+
			' sum(cb.fours) fours,sum(cb.sixes) sixes'+
			' from csn_batsman_match_dtls cb'+
			' where cb.match_uuid in (select m.uuid'+
			' from csn_match m where m.tournament_uuid=?)'+
			' and cb.player_uuid = ?'+
			' group by cb.player_uuid,cb.player_name;';
  
    con.query(sql,[tournament_id,player_id], function (err, result, fields) {
    if (err) throw err;
	twing.render('batsmanseriescard.twig', {'batsman_details': result}).then((output) => {
      res.end(output);
  });
  
  }); 
}); 

app.get('/bowlerseriescard', function (req, res) {
  var player_id = req.query.player_id;
  var tournament_id = req.query.tournament_id;
  
  var sql = ' select  cb.player_uuid,cb.player_name,count(cb.match_uuid) matches, '+
			' sum(cb.balls) balls,sum(cb.runs) runs,sum(cb.wickets) wickets,'+
			' (select concat(s.wickets,\'-\',s.runs)'+
			' from csn_bowler_match_dtls s'+
			' where s.player_uuid=cb.player_uuid'+
			' order by s.wickets desc,s.runs,s.overs desc'+
			' limit 1) best_figures,round(sum(cb.runs)/sum(cb.overs),2) economy_rate,'+
			' round(sum(cb.runs)/sum(cb.wickets),2) bowling_avg,'+
			' round(sum(cb.balls)/sum(cb.wickets),2) bowling_strike_rate'+
			' from csn_bowler_match_dtls cb'+
			' where cb.match_uuid in (select m.uuid'+
			' from csn_match m where m.tournament_uuid=?)'+
			' and cb.player_uuid = ?'+
			' group by cb.player_uuid,cb.player_name;';
  
    con.query(sql,[tournament_id,player_id], function (err, result, fields) {
    if (err) throw err;
	twing.render('bowlerseriescard.twig', {'bowler_details': result}).then((output) => {
      res.end(output);
  });
  
  }); 

  
}); 

app.get('/pointstablecard', function (req, res) {
  var tournament_id = req.query.tournament_id;
  var sql = 'select * from csn_tournament_points_table where tournament_uuid = ?;';
  
    con.query(sql,tournament_id, function (err, result, fields) {
    if (err) throw err;
	twing.render('pointstablecard.twig', {'tournament_details': result}).then((output) => {
      res.end(output);
  });
  
  }); 
}); 


http.listen(3000, function(){
    console.log('HTTP server started on port 3000');
});
