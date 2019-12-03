class RentalPresenter < SimpleDelegator
  def initialize(rental)
    super(rental)
  end

  def status
    if scheduled?
      'agendada'
    elsif in_review?
      '<span class="badge badge-primary">em revisão</span>'
    elsif ongoing?
      '<span class="badge badge-primary">em andamento</span>'
    elsif finalized?
      'finalizada'
    end
  end
end
