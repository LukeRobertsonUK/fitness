
var autoCompleteExercise = function(selector){
  selector.autocomplete({
    source: '/list.json'
  })
}


var exerciseTypeChange = function(selector){
  selector.change(function(){
    if(selector.val() == "Reps"){
      selector.parent().find('.distance_field').fadeOut(125);
      selector.parent().find('.interval_field').fadeOut(125);
      setTimeout(function(){
        selector.parent().find('.reps_field').fadeIn(125);
      }, 125);
    }else{
      if(selector.val() == "Distance"){
        selector.parent().find('.reps_field').fadeOut(125);
        selector.parent().find('.interval_field').fadeOut(125);
        setTimeout(function(){
          selector.parent().find('.distance_field').fadeIn(125).css("display", "inline");
        }, 125);
      }else{
        if(selector.val() == "Interval"){
          selector.parent().find('.reps_field').fadeOut(125);
          selector.parent().find('.distance_field').fadeOut(125);
          setTimeout(function(){
            selector.parent().find('.interval_field').fadeIn(125).css("display", "inline");
          },125);
        }else{
          selector.parent().find('.reps_field').fadeOut(125);
          selector.parent().find('.distance_field').fadeOut(125);
          selector.parent().find('.interval_field').fadeOut(125);
      }
    }
  }
  })

}


$(function() {

  var initialExerciseFields = $('.exercise_entry');

  for(var i = 0; i < initialExerciseFields.length; i++){
    autoCompleteExercise(initialExerciseFields.eq(i))
  };

  var initialExerciseTypes = $('.exercise_type');

  for(var i = 0; i < initialExerciseTypes.length; i++){
    exerciseTypeChange(initialExerciseTypes.eq(i))
  };



  $(document).on('nested:fieldAdded', function(event){

    var exerciseSelector = event.field.find('.exercise_entry');
    autoCompleteExercise(exerciseSelector);

    var exerciseType = event.field.find('.exercise_type');
    exerciseTypeChange(exerciseType);
  })






});