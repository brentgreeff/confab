module ChangeMessageBuilder
  extend self

  def from(changes:)
    changes.each_with_object([]) do |(attrib, values), accum|
      accum << "#{attrib.titlecase} changed from #{this_to_that(values)}"
    end.join(", ")
  end

  private

  def this_to_that(values)
    "\"#{values.first}\" to \"#{values.last}\""
  end
end
