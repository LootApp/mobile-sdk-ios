module Fastlane
    module Actions
      module SharedValues
        FL_ZIP_FILE_FRAMEWORK_PATH = :FL_ZIP_FILE_FRAMEWORK_PATH
        FL_ZIP_FILE_FRAMEWORK_NAME = :FL_ZIP_FILE_FRAMEWORK_NAME
      end
  
      class ZipFileHelperAction < Action
        def self.run(params)
          
          zipfile = "export/#{params[:framework_name]}.framework.zip"
          Zip::File.open(zipfile, Zip::File::CREATE) do |zip|
            zip.add("#{params[:framework_name]}.framework",params[:framework_path])
          end
        end
  
        #####################################################
        # @!group Documentation
        #####################################################
  
        def self.description
          "Zip a framework"
        end
  
        def self.details
          "Zip the given framework name at the given framework path"
        end

        def self.available_options
          [
            FastlaneCore::ConfigItem.new(key: :framework_path,
                                         env_name: "FL_ZIP_FILE_FRAMEWORK_PATH",
                                         description: "The framework path",
                                         optional: false,
                                         is_string: true),
            FastlaneCore::ConfigItem.new(key: :framework_name,
                                         env_name: "FL_ZIP_FILE_FRAMEWORK_NAME",
                                         description: "The framework name",
                                         optional: false,
                                         is_string: true)
          ]
        end
  
        def self.authors
          "serluca"
        end
  
        def self.is_supported?(platform)
          true
        end
      end
    end
  end