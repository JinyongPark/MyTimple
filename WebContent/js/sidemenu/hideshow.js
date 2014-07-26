//  Andy Langton's show/hide/mini-accordion @ http://andylangton.co.uk/jquery-show-hide

// this tells jquery to run the function below once the DOM is ready
ja(document).ready(function() {

// choose text for the show/hide link - can contain HTML (e.g. an image)
var showText='보이기';
var hideText='숨기기';

// initialise the visibility check
var is_visible = false;

// append show/hide links to the element directly preceding the element with a class of "toggle"
ja('.toggle').prev().append(' <a href="#" class="toggleLink">'+hideText+'</a>');

// hide all of the elements with a class of 'toggle'
ja('.toggle').show();

// capture clicks on the toggle links
ja('a.toggleLink').click(function() {

// switch visibility
is_visible = !is_visible;

// change the link text depending on whether the element is shown or hidden
if (ja(this).text()==showText) {
ja(this).text(hideText);
ja(this).parent().next('.toggle').slideDown('slow');
}
else {
ja(this).text(showText);
ja(this).parent().next('.toggle').slideUp('slow');
}

// return false so any link destination is not followed
return false;

});
});