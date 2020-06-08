class ConversationsController < ApplicationController
  before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  def index
    @conversations = policy_scope(Conversation).all
  end

  def show
    @conversation = Conversation.find(params[:id])
  end
end
