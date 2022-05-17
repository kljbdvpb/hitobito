#  Copyright (c) 2022, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

module TableDisplays::People
  class LayerGroupLabelColumn < TableDisplays::Column

    def required_permission(attr)
      :show
    end

    def required_model_attrs(attr)
      []
    end

    def render(attr)
      super do |object, attr|
        value_for(object, attr) do |target, target_attr|
          template.format_attr(target, target_attr) if object.respond_to?(attr)
        end
      end
    end

    def sort_by(attr)
      nil
    end
  end
end
