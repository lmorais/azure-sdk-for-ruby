# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::MediaServices
  module Models
    #
    # The request body for CheckNameAvailability API.
    #
    class CheckNameAvailabilityInput

      include MsRestAzure

      # @return [String] The name of the resource. A name must be globally
      # unique.
      attr_accessor :name

      # @return [String] Specifies the type of the resource. Default value:
      # 'mediaservices' .
      attr_accessor :type


      #
      # Mapper for CheckNameAvailabilityInput class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'CheckNameAvailabilityInput',
          type: {
            name: 'Composite',
            class_name: 'CheckNameAvailabilityInput',
            model_properties: {
              name: {
                required: true,
                serialized_name: 'name',
                constraints: {
                  MaxLength: 24,
                  MinLength: 3,
                  Pattern: '^[a-z0-9]'
                },
                type: {
                  name: 'String'
                }
              },
              type: {
                required: true,
                is_constant: true,
                serialized_name: 'type',
                default_value: 'mediaservices',
                type: {
                  name: 'String'
                }
              }
            }
          }
        }
      end
    end
  end
end
