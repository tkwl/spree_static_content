RSpec.describe Spree::StaticContentController, type: :controller do
  let!(:store) { create(:store, default: true) }

  before do
    allow(controller).to receive(:spree_current_user).and_return(nil)
    allow(controller).to receive(:current_store).and_return(store)
  end

  context '#show' do
    it 'accepts path as root' do
      page = create(:page, slug: '/', stores: [store])
      request.path = page.slug
      get :show, params: { path: page.slug }
      expect(response.status).to eq(200)
    end

    it 'accepts path as string' do
      page = create(:page, slug: 'hello', stores: [store])
      request.path = page.slug
      get :show, params: { path: page.slug }
      expect(response.status).to eq(200)
    end

    it 'accepts path as nested' do
      page = create(:page, slug: 'aa/bb/cc', stores: [store])
      request.path = page.slug
      get :show, params: { path: page.slug }
      expect(response.status).to eq(200)
    end

    it 'respond with a 404 when no page exists' do
      expect { get :show }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
