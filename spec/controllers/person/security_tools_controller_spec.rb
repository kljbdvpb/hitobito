# frozen_string_literal: true

#  Copyright (c) 2012-2021, Pfadibewegung Schweiz. This file is part of
#  hitobito_cvp and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Person::SecurityToolsController do

  let(:nesting)    { { group_id: @user.primary_group.id, id: @user.id } }
  let(:bottom_member) { people(:bottom_member) }
  let(:top_leader) { people(:top_leader) }

  before { sign_in(top_leader) }

  context 'GET#index' do
    it 'can show security overview if able to edit person' do
      sign_in(top_leader)

      @user = bottom_member

      get :index, params: nesting

      expect(response).to have_http_status(200)
    end

    it 'can not show security overview if not able to edit person' do
      sign_in(bottom_member)

      @user = top_leader

      expect do
        get :index, params: nesting
      end.to raise_error(CanCan::AccessDenied)
    end
  end
end
