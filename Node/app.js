const express    = require('express')
const bodyParser = require('body-parser')

const app = express()
app.get('/imangi', function(req, res){
   try{
 for(var prop in req.query){
	 if (req.query.hasOwnProperty(prop)) {
		res.write(prop);
		res.write("=")
		res.write(req.query[prop]);
		res.write(";")
		console.log(prop ,"=" , req.query[prop]);
	}
	}
	res.status(200).send();
	}
catch(err){
	res.status(501).send("Unable to Parse "+err);
}
}); 


app.listen(8080);