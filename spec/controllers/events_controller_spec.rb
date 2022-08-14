require 'rails_helper'

RSpec.describe Admin::EventsController, type: :controller do
  let(:event) { create(:event) }
  let(:client) { create(:admin) }

  before { login(client) }

  describe 'GET #index' do
    it 'renders index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'renders show view' do
      get :show, params: { id: event }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'renders new view' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'renders edit view' do
      get :edit, params: { id: event }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:params) { { admin_id: client.id, event: attributes_for(:event) } }

      it 'saves a new event in the databased' do
        expect { post :create, params: params }.to change(Event, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: params

        expect(response).to redirect_to action: :show, id: assigns(:event)
      end
    end

    context 'with invalid attributes' do
      let(:params) { { admin_id: client.id, event: attributes_for(:event, :invalid) } }

      it 'does not save the event' do
        expect { post :create, params: params }.not_to change(Event, :count)
      end

      it 're-renders new view' do
        post :create, params: params

        expect(response).to render_template :new
      end
    end
  end

  describe 'POST #update' do
    context 'with valid attributes' do
      let(:attributes) { attributes_for(:event) }
      before { patch :update, params: { id: event, event: attributes } }

      it 'changes event attributes' do
        event.reload

        expect(event.title).to eq attributes[:title]
        expect(event.body).to eq attributes[:body]
      end

      it 'redirects to updates event' do
        expect(response).to redirect_to action: :show, id: assigns(:event)
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: event, event: attributes_for(:event, :invalid) } }

      it 'does not change event' do
        event.reload

        expect(event.body).to eq "Event test body"
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:event) { create(:event) }

    it 'deletes the event' do
      expect { delete :destroy, params: { id: event } }.to change(Event, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: event }

      expect(response).to redirect_to admin_events_path
    end
  end
end
