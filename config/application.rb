require_relative "boot"

# 必要な機能だけを個別に読み込む
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_view/railtie"
require "action_mailer/railtie"
require "action_cable/engine"

# Gemfileに記載されたライブラリをロード
Bundler.require(*Rails.groups)

module PolyglotBackend
  class Application < Rails::Application
    # Rails 8.1 のデフォルト設定を使用
    config.load_defaults 8.1

    # オートロードから除外するディレクトリ
    config.autoload_lib(ignore: %w[assets tasks])

    # API専用モード（ビューやセッション機能などをスキップ）
    config.api_only = true
  end
end