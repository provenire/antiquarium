RailsAdmin.config do |config|

  # Authorization
  config.authorize_with :cancan
  config.current_user_method(&:current_user)

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    history_index
    history_show
  end


  # Configurations
  config.model 'Affiliation' do
    edit do
      exclude_fields :uuid, :slug, :versions
    end
  end

  config.model 'Annotation' do
    edit do
      exclude_fields :uuid, :versions, :location
    end
  end

  config.model 'Artifact' do
    edit do
      exclude_fields :uuid, :slug, :versions, :events, :annotations,
                     :annotated_pages, :annotated_sources, :photos,
                     :citations, :sources
    end
  end

  config.model 'Event' do
    edit do
      exclude_fields :uuid, :slug, :versions, :name, :people, :places, :sources, :citations, :interactions
    end
  end

  config.model 'Interaction' do
    edit do
      exclude_fields :versions
    end
  end

  config.model 'Page' do
    edit do
      exclude_fields :source, :number, :image
    end
  end

  config.model 'Person' do
    edit do
      exclude_fields :uuid, :slug, :versions, :events, :annotations,
                     :annotated_pages, :annotated_sources, :photos,
                     :citations, :sources, :interactions, :source_events,
                     :affiliations
    end
  end

  config.model 'Place' do
    edit do
      exclude_fields :uuid, :slug, :versions, :events, :annotations,
                     :annotated_pages, :annotated_sources, :photos,
                     :citations, :sources, :interactions, :source_events,
                     :affiliations
    end
  end

  config.model 'Source' do
    edit do
      exclude_fields :uuid, :slug, :versions, :image, :document, :identifier, :pages, :annotations, :citations
    end
  end

  config.model 'User' do
    edit do
      group :default do
        field :email
        field :name
        field :description
        field :company
        field :location
        field :password
        field :password_confirmation
        field :role do
          read_only true
        end
      end
    end
  end

  config.model 'Verb' do
    edit do
      exclude_fields :events
    end
  end

end


# Add UUID Support (really admin_rails?)
module RailsAdmin::Config::Fields::Types
  class UUID < RailsAdmin::Config::Fields::Base
    RailsAdmin::Config::Fields::Types::register(:uuid, self)

    def allowed_methods
      [@name]
    end

    def dom_name
      @dom_name ||= "#{bindings[:form].object_name}_#{@name}"
    end
  end
end
