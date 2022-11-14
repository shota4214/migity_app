class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: %i[show edit update destroy]
  before_action :different_login_and_note_users, only: %i[show edit]
  before_action :note_index, only: %i[index search]
  
  def index
    @q = @notes.ransack(params[:q])
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.new(note_params)
    if @note.save
      redirect_to notes_path, notice:  "ノートを保存しました"
    else
      render :new
    end
  end

  def show
  end
  
  def edit    
  end

  def update
    if @note.update(note_params)
      redirect_to notes_path, notice: "ノートを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path, notice: "ノートを削除しました"
  end

  def search
    search_words = params[:q][:title_or_content_body_cont].split(/[\p{blank}\s]+/)
    grouping_hash = search_words.reduce({}){|hash, word| hash.merge(word => {title_or_content_body_cont: word})}
    @results = @notes.ransack({combinator: 'and', groupings: grouping_hash, s: 'updated_at DESC'}).result
  end

  private

  def note_params
    params.require(:note).permit(:title, :content)
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def different_login_and_note_users
    redirect_to notes_path unless current_user.id == @note.user_id
  end

  def note_index
    @notes = current_user.notes.order(updated_at: :desc)
  end
end
