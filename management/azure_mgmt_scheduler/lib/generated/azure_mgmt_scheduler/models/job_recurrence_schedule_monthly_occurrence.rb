# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Scheduler
  module Models
    #
    # Model object.
    #
    class JobRecurrenceScheduleMonthlyOccurrence

      include MsRestAzure

      # @return [JobScheduleDay] Gets or sets the day. Must be one of monday,
      # tuesday, wednesday, thursday, friday, saturday, sunday. Possible
      # values include: 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
      # 'Friday', 'Saturday', 'Sunday'
      attr_accessor :day

      # @return [Integer] Gets or sets the occurrence. Must be between -5 and
      # 5.
      attr_accessor :occurrence


      #
      # Mapper for JobRecurrenceScheduleMonthlyOccurrence class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'JobRecurrenceScheduleMonthlyOccurrence',
          type: {
            name: 'Composite',
            class_name: 'JobRecurrenceScheduleMonthlyOccurrence',
            model_properties: {
              day: {
                required: false,
                serialized_name: 'day',
                type: {
                  name: 'Enum',
                  module: 'JobScheduleDay'
                }
              },
              occurrence: {
                required: false,
                serialized_name: 'Occurrence',
                type: {
                  name: 'Number'
                }
              }
            }
          }
        }
      end
    end
  end
end
