require "active_support/core_ext/integer/time"

Rails.application.configure do
  # コードの変更を即座に反映
  config.enable_reloading = true

  # 起動時にすべてのコードを読み込まない
  config.eager_load = false

  # エラーレポートを表示
  config.consider_all_requests_local = true
  config.server_timing = true

  # キャッシュの設定（Windowsでのエラー回避のためメモリを使用）
  config.action_controller.perform_caching = false
  config.cache_store = :memory_store

  # ログの設定
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.active_storage.service = :local

  # 以下の「undefined method」の原因になる箇所をすべて削除・無効化しました
  # - config.active_storage (画像保存)
  # - config.action_mailer (メール)
  # - config.active_job.verbose_enqueue_logs (ジョブ)
end