# InflectThis
# A centralized module for irregular inflections in Rails.
# Add to the list if you want; comment out any inflections that would interfere with 
# any legacy tables that you might have.

module CustomInflectors

  # The following are already handled by ActiveSupport::Inflector, so don't bother adding them:
  #
  #   analysis, axis, bacterium, basis, bureau, child, crisis, datum, diagnosis, ellipsis, fish,
  #   hypothesis, louse, man, matrix, means, medium, mouse, oasis, ox, paralysis, parenthesis, 
  #   series, sheep, species, stratum, synopsis, synthesis, thesis, woman
  
  IRREGULAR_INFLECTORS = [
    [ "alumnus", "alumni" ],
    [ "appendix", "appendices" ],
    [ "beau", "beaux" ],
    [ "cactus", "cacti" ],
    [ "caucus", "caucuses" ],
    [ "corpus", "corpora" ],
    [ "criterion", "criteria" ],
    [ "curriculum", "curricula" ],
    [ "deer", "deer" ],
    [ "focus", "foci" ],
    [ "foot", "feet" ],
    [ "fungus", "fungi" ],
    [ "genus", "genera" ],
    [ "goose", "geese" ],
    [ "index", "indeces" ],
    [ "memorandum", "memoranda" ],
    [ "nebula", "nebulae" ],
    [ "nucleus", "nuclei" ],
    [ "offspring", "offspring" ],
    [ "phenomenon", "phenomena" ],
    [ "radius", "radii" ],
    [ "stimulus", "stimuli" ],
    [ "tableau", "tableaux" ],
    [ "tooth", "teeth" ],
    [ "vertebra", "vertebrae" ],
    [ "vita", "vitae" ]
  ]

  # Check for redundancies
  _duplicates = []
  ActiveSupport::Inflector.inflections do |inflect|
    IRREGULAR_INFLECTORS.each do |i|
      if ActiveSupport::Inflector.pluralize(i[0]) == i[1]
        _duplicates << i[0]
      else
        inflect.irregular i[0], i[1]
      end
    end
  end
  
  # Report on redundant overrides
  puts "CustomInflector: The following inflector overrides are redundant and have been skipped: #{_duplicates * ', '}" unless _duplicates.empty?

  # Check for possible conflicts
  _overrides = IRREGULAR_INFLECTORS.flatten
  _possible_conflicts = [] # FIXME: check in the usual places for conflicting names of models, controllers, et al
  _conflicts = []
  _possible_conflicts.each{ |c| _conflicts << c if _overrides.include?(c.downcase) }
  
  # Report on possible conflicts
  puts "CustomInflector: The following inflector overrides may raise a conflict in your application: #{_conflicts * ', '}" unless _conflicts.empty?
    
end