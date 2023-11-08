require 'rails_helper'

RSpec.describe Api::UnitsController, type: :controller do
  describe 'GET /api/units' do
    render_views
    let!(:unit) { create(:unit) }
    
    
    it 'return status ok' do
      get :index, format: :json
      expect(response).to have_http_status(200)
      expect(response.body).to have_content(unit.title)
    end

  end

  describe 'post /api/units' do
    render_views

    body = {
      unit: {
        title: "title",
        content: "content",
        opened: true,
        mask: "recommended",
        towel: "recommended",
        fountain: "allowed",
        locker_room: "allowed",
        schedules_attributes: [
          {
            weekdays: "monday",
            hour: "10h às 19h"
          },
          {
            weekdays: "tuesday",
            hour: "10h às 19h"
          }
        ]
      }
    }
    
    it 'return status ok' do
      post :create, params: body, as: :json
      expect(response).to have_http_status(201)
    end
  end

  describe 'put /api/units' do
    render_views
    let!(:schedule) { create(:schedule) }
    let!(:unit) { create(:unit, schedules: [schedule]) }

    it 'return status ok' do
      put :update, params: {
        id: unit.id,
        unit: {
          title: "title",
          content: "content",
          opened: true,
          mask: "recommended",
          towel: "recommended",
          fountain: "allowed",
          locker_room: "allowed",
          schedules_attributes: [
            {
              weekdays: "monday",
              hour: "10h às 19h"
            },
            {
              weekdays: "tuesday",
              hour: "10h às 19h"
            }
          ]
        }
      }, as: :json
      expect(response).to have_http_status(202)
    end
  end

  describe 'delete /api/units' do
    render_views
    let!(:unit) { create(:unit) }

    it 'return status ok' do
      delete :destroy, params: { id: unit.id }, as: :json
      expect(response).to have_http_status(204)
    end
  end
end