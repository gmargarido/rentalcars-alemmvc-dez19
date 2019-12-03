class RentalPresenter < SimpleDelegator
  def initialize(rental)
    super(rental)
  end

  def status
    if scheduled?
      '<span class="badge badge-primary">agendada</span>'
    end
  end
end
