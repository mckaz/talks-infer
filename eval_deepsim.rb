Rails.application.eager_load! ## load Rails app

RDL::Config.instance.number_mode = true

require 'types/active_record'

require_relative 'orig_types.rb'

RDL::Config.instance.promote_widen = true

RDL::Heuristic.get_rank_accs(:arg)
RDL::Heuristic.get_rank_accs(:ret)
