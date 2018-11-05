require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:

# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

describe PostsHelper, type: :helper do

end



# user logs in
# ask if user want o use geoposition
# if yes => save to session
# if not => save geoposition by IP only

# create get_location_by_gps
# create get_location_by_ip
# 