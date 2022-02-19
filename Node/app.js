const express    = require('express')
const bodyParser = require('body-parser')

const app = express()
app.get('/imangi', function(req, res){
   try{
		res.write("Name "+req.query.name);
		res.write("Phone "+req.query.phone);
		res.write("Country "+req.query.country_code);
		res.write("Text "+req.query.text);
	if(req.query.name.length<1 || req.query.phone.length<1 || req.query.country_code.length<1 || req.query.text.length<1){
	res.status(500).send("Wrong Request");
}	else{
	res.status(200).send();
}
	}
catch(err){
	console.log(err);
	res.status(500).send("Unable to Parse "+err);
}
}); 


app.listen(8080);