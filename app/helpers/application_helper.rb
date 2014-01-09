module ApplicationHelper



def component_heading(component)
  if component.to_failure
    "#{component.exercise_name}: to failure"
  elsif component.reps
    "#{component.exercise_name}: #{pluralize(component.reps, 'rep')}"
  elsif component.interval
    case component.interval_units
    when "seconds" then "#{component.exercise_name}: #{pluralize(component.interval, 'second')}"
    when "minutes" then "#{component.exercise_name}: #{pluralize(component.interval, 'minute')}"
    end
  elsif component.distance
    case component.distance_units
    when "metres" then "#{component.exercise_name}: #{pluralize(component.distance, 'metre')}"
    when "kilometres" then "#{component.exercise_name}: #{pluralize(component.distance, 'kilometre')}"
    end
  end
end



end
