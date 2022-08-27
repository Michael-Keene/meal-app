# frozen_string_literal: true
class UserTargetsPresenter < EdiblePresenters::Base

  def initialize(object)
    @user = object if object.is_a?(User)
    @macro_collection = object.is_a?(User) ? object.targets : object
  end

  def name
    if @user
    "Today's Target"
    else
      "Today's #{(macro_collection.fetch(:type) { 'Intake' }).to_s.classify} Totals"
    end
  end

  def edit_path
    url_helper
      .edit_user_targets_path(@user)
  end

  def dom_id
    if @user
      ActionView::RecordIdentifier.dom_id(
        @user,
        :target_macros
      )
    else
      "#{name} user #{(macro_collection.fetch(:user) { @current_user }).id}".split.join('_').downcase.gsub("'", '')
    end
  end

  # you cannot delete macro_collection
  def deletable?
    false
  end

  # you cannot directly edit macro_collection
  def directly_editable?
    @user.present?
  end

  private

  attr_reader :macro_collection

  def stats_for_macro(macro)
    macro_collection.fetch(macro) do
      raise NoMethodError, 'macro accessor not set'
    end
  end

end
