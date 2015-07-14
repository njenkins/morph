class Plan
  attr_reader :stripe_plan_id

  def initialize(stripe_plan_id)
    @stripe_plan_id = stripe_plan_id
  end

  def self.all_stripe_plan_ids
    %w(morph_basic morph_standard morph_advanced)
  end

  # For users with these plans we highlight them
  # Highest plan comes first
  def self.featured_plans
    %w(morph_advanced morph_standard).map do |stripe_plan_id|
      Plan.new(stripe_plan_id)
    end
  end

  def name
    case stripe_plan_id
    when 'morph_basic'
      'Supporter'
    when 'morph_standard'
      'Hero'
    when 'morph_advanced'
      'Partner'
    else
      fail
    end
  end

  def price
    case stripe_plan_id
    when 'morph_basic'
      14
    when 'morph_standard'
      24
    when 'morph_advanced'
      149
    end
  end

  def price_in_cents
    price * 100 if price
  end

  def ==(plan)
    stripe_plan_id == plan.stripe_plan_id
  end
end
