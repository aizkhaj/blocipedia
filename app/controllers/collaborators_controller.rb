class CollaboratorsController < ApplicationController
  before_action :authenticate_user!

  def create
    wiki = Wiki.find(params[:wiki_id])
    new_collaborator = User.find_by(email: params[:email])
    collaborator = wiki.collaborators.new(user: new_collaborator)
    possible_duplicate = wiki.collaborators.find_by(user: new_collaborator)

    if new_collaborator.nil?
      flash[:alert] = "Collaborator was not added because this user does not exist."
      redirect_to edit_wiki_path(wiki)
    elsif possible_duplicate == new_collaborator
      flash[:alert] = "This collaborator was already added to this wiki."
      redirect_to edit_wiki_path(wiki)
    else
      if collaborator.save
        flash[:notice] = "Collaborator added."
      else
        flash[:alert] = "Collaborator was not added due to an error."
      end
      redirect_to [wiki]
    end
  end

  def destroy
    wiki = Wiki.find(params[:wiki_id])
    collaborator = Collaborator.find(params[:id])

    if collaborator.destroy
      if collaborator.nil?
        flash[:alert] = "Collaborator does not exist."
      else
        flash[:notice] = 'Collaborator removed.'
      end
    else
      flash[:alert] = 'Collaborator could not be removed due to an error.'
    end

    redirect_to [wiki]
  end
end
