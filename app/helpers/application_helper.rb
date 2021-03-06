module ApplicationHelper

def component_heading(component)
  case component.exercise_type
  when "To Failure" then "#{component.exercise_name} to failure"
  when "Reps" then "#{component.exercise_name}: #{pluralize(component.reps, 'rep')}"
  when "Interval" then component.interval_units == "seconds" ? "#{component.exercise_name} for #{pluralize(component.interval, 'second')}" : "#{component.exercise_name} for #{pluralize(component.interval, 'minute')}"
  when "Distance" then component.distance_units == "metres" ? "#{component.exercise_name} for #{pluralize(component.distance, 'metre')}" : "#{component.exercise_name} for #{pluralize(component.distance, 'kilometre')}"
  end
end

def component_heading_for_weight_entry(component)
  heading = component_heading(component)
  "#{pluralize(component.activity.sets, 'set')} of #{heading}"

end

def activity_rest(activity)
  activity.rest_units == "seconds" ? "Rest for #{pluralize(activity.rest, 'second')}" : "Rest for #{pluralize(activity.rest, 'minute')}"
end

def weights_list(component)
  array = []
  component.weight_records.each {|record| array << [record.weight, record.weight_unit] }
  "(#{array.compact.map {|item| item.join('')}.join(', ')})"
end

def list_exercises(workout)
  workout.components.order('created_at').map {|component| "#{component.exercise_name} (#{pluralize(component.activity.sets, 'set')})"}.join(", ")
end


def snapshot(workout)
  workout.activities.map { |activity| [activity.sets, "#{activity.components.order('created_at').map{|component| component.exercise_name}.to_sentence}"] }.map {|item| "#{pluralize(item[0], 'set')} of #{item[1]}"}.join(' | ')
end

def pb_string(user, exercise)
  "Personal Best: #{(user.personal_best(exercise).weight).round(2)}kg / #{(user.personal_best(exercise).weight*WeightRecord::RATIO_OF_POUNDS_TO_KILOS).round(2)}lb"
end

end