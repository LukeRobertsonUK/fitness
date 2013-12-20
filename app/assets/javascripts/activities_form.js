
var autoCompleteExercise = function(selector){
  selector.autocomplete({
    source: '/list.json'
  })
}


$(function() {

  var initialExerciseFields = $('.exercise_entry');

  for(var i = 0; i < initialExerciseFields.length; i++){
    autoCompleteExercise(initialExerciseFields.eq(i))
  };

  $(document).on('nested:fieldAdded', function(event){

    var exerciseSelector = event.field.find('.exercise_entry');

    autoCompleteExercise(exerciseSelector);
  })

});