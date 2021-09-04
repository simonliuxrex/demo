require 'rails_helper'

describe Api::WalletController, type: :request do

  context 'InsufficientFund' do
    let (:user_1) { create(:user) }
    let (:user_2) { create(:user) }
    before do
      login_with_api(user_1)
      post "/api/transfer",
        headers: {
        'Authorization': response.headers['Authorization']
        },
        params: {
          amount: 10.99,
          receipient: user_2.email
        }
    end

    it 'Normal transfer' do
      expect(response.status).to eq(400)
      expect(response.body).to eq("{\"errors\":[{\"status\":\"400\",\"title\":\"InsufficientFund\"}]}")
    end
  end

  context 'InsufficientFund' do
    let (:user_1) { create(:user, balance: 100) }
    let (:user_2) { create(:user) }
    before do
      login_with_api(user_1)
      post "/api/transfer",
        headers: {
        'Authorization': response.headers['Authorization']
        },
        params: {
          amount: 10.99,
          receipient: user_2.email
        }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq (
        {
          "data"=>
            {
              "id"=>user_1.id.to_s,
              "type"=>"users",
              "attributes"=>{
                "email"=>user_1.email,
                "balance"=> 100-10.99
              }
            },
          "jsonapi"=>
            {
              "version"=>"1.0"
            }
        }
      )
    end
  end

end
