module Fastlane
    module Actions
      module SharedValues
        FL_INSERT_ENTRY_FILE_PATH = :FL_INSERT_ENTRY_FILE_PATH
        FL_INSERT_ENTRY_FRAMEWORK_NAME = :FL_INSERT_ENTRY_FRAMEWORK_NAME
        FL_INSERT_ENTRY_RELEASE_VERSION = :FL_INSERT_ENTRY_RELEASE_VERSION
      end
  
      class InsertEntryAction < Action
        def self.run(params)
        	release_address = "https://github.com/LootApp/mobile-sdk-ios/releases/download/#{params[:release_version]}/#{params[:framework_name]}.framework.zip"
			    file = File.read(params[:file_path])
  		    hash = JSON.parse(file)
  		    hash[params[:release_version]] = release_address
  		    newJson = JSON.pretty_generate hash
	      	File.write(params[:file_path], newJson)
        end
  
        #####################################################
        # @!group Documentation
        #####################################################
  
        def self.description
          "Insert new release entry in the given json"
        end
  
        def self.details
          "Insert the given release number entry in the given json"
        end

        def self.available_options
          [
            FastlaneCore::ConfigItem.new(key: :file_path,
                                         env_name: "FL_INSERT_ENTRY_FILE_PATH",
                                         description: "The file path",
                                         optional: false,
                                         is_string: true),
            FastlaneCore::ConfigItem.new(key: :framework_name,
                                         env_name: "FL_INSERT_ENTRY_FRAMEWORK_NAME",
                                         description: "The framework name",
                                         optional: false,
                                         is_string: true),
            FastlaneCore::ConfigItem.new(key: :release_version,
                                         env_name: "FL_INSERT_ENTRY_RELEASE_VERSION",
                                         description: "The release verion",
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