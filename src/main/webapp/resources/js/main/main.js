var script = document.createElement('script');
script.src = 'https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js';
script.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(script);

function fnLocationInsertPartyPage() {
	location.href = '/purple/party/insert';
}