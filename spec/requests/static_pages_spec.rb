# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Static pages', type: :request do
  it 'returns success' do
    get '/home'
    expect(response).to be_successful
  end
end
