# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

include FactoryBot::Syntax::Methods

UserViewingParty.destroy_all
User.destroy_all
ViewingParty.destroy_all

@user1 = create(:user)
@user2 = create(:user)
@user3 = create(:user)

@viewing_party1 = create(:viewing_party)
@viewing_party2 = create(:viewing_party)
@viewing_party3 = create(:viewing_party)

@user_viewing_party1 = create(:user_viewing_party, user: @user1, user_type: 'Hosting', viewing_party: @viewing_party1)
@user_viewing_party2 = create(:user_viewing_party, user: @user2, user_type: 'Invited', viewing_party: @viewing_party1)
@user_viewing_party3 = create(:user_viewing_party, user: @user2, user_type: 'Hosting', viewing_party: @viewing_party2)
