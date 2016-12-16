var mongojs = require('mongojs');
var db = mongojs('datashot_mongoadmin:yooMuz9Sho@localhost:21184/admin', ['jeopardy', 'task1_3result']);

var mongodb = require('mongodb')


var mapper = function() {
	emit("value", this.value);
};

var reducer = function(key, value){
	console.log('reducer', [key, value]);
	return param;
};

/*db.jeopardy.find(function(err, doc) {
	console.log('testdata');
	for (var i = 0; i < 10; i++) {
    console.log(doc[i]);
}	
});*/

db.jeopardy.mapReduce(
	function() {
		// mapper
		emit(this.value, 1);
	},
	function(key, value) {
		// reducer
		return Array.sum(value);
	},
	{
		out: 'task1_3result',
		verbose: true,
		limit: 100
	}
);

var list = [];

db.task1_3result.find(function (err, docs){
	if (err) console.log(err);
	var sum = 0;
	var mark = -1;
	for (var i = 0; i < docs.length; i++) {
		if (docs[i]._id != null) {
			var val = parseInt(docs[i]._id.split('$')[1].replace(',',''));
			mark = -1
			for (var j = 0; j < list.length; j++) {
				if (list[j].key == val) {
					mark = j;
					break;
				}
			}
		
			if(mark == -1) {
				list.push({"key": val, "value": docs[i].value})
			} else {
				list[mark].value += docs[i].value
			}
			sum += val*docs[i].value;
		}
    }
	console.log('result', docs);
	console.log('sum', sum);
	console.log('valueOrdered:', list);
});



/*db.task1_3result.find( function( err, docs) {
	if (err) console.error(err);
	
	for (var i = 0; docs.length-1; i++) {
    	
	}
});*/