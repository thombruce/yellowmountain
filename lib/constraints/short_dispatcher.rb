module Constraints
  class ShortDispatcher
    def initialize(router)
      @router = router
    end
    def call(env)
      id     = env["action_dispatch.request.path_parameters"][:id]
      slug   = VanityUrl.find_by_slug(id.downcase)
      Render.new(slug).call(@router, env)
    end

    private

    class Render
      def initialize(url)
        @url = url
      end
      def call(router, env)
        routing    = Rails.application.routes.recognize_path(@url.target)
        controller = (routing[:controller] + "_controller").classify.constantize
        action     = routing[:action]
        env["action_dispatch.request.path_parameters"] = routing
        controller.action(action).call(env)
      end
    end
  end
end