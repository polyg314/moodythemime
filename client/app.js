
var moods = {
	0 : {mood: "happy", url: "url(http://www.talkbollywood.com/wp-content/uploads/2012/08/Sonam-Kapoor-The-Mime-Look-2.jpg)"},
	1 : {mood: "so-so", url: "url(http://www.talkbollywood.com/wp-content/uploads/2012/08/Sonam-Kapoor-The-Mime-Look-4.jpg?2e60b4)"},
	2 : {mood: "excited", url: "url(http://www.pinkvilla.com/files/images/son8.jpg)"},
	3 : {mood: "mad", url: "url(http://www.talkbollywood.com/wp-content/uploads/2012/08/Sonam-Kapoor-The-Mime-Look-5.jpg)"},
	4 : {mood: "sad", url: "url(http://www.talkbollywood.com/wp-content/uploads/2012/08/Sonam-Kapoor-The-Mime-Look-1.jpg)"},
};

var firstClick = 0; 
var last = '';

$(document).click("#button",function(){
	var random;

	var checker = $(".card").attr("style").split("matrix3d")[1].split(',')[5];
	console.log(checker)
	console.log(checker == 0)
	if(firstClick === 0){
		firstClick ++;
	}
	else if(checker == 0){
		$(".button").text("How is Moody?")
	}
	else if (checker == 1){
		random = Math.floor(Math.random() * 5);
		if(moods[random].mood === last){
			$(".faceCard").text("Moody is still " + moods[random].mood)
		}
		else{
			$(".faceCard").text("Moody is " + moods[random].mood)
		}
		$(".faceCard").css("background-image", moods[random].url)
		$(".button").text("Bring up card")
		last = moods[random].mood
	}
})