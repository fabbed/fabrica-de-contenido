Gem::Specification.new do |s|
  s.name = 'money'
  s.version = '1.7.4'
  s.summary = "Class aiding in the handling of Money."
  s.description = 'Class aiding in the handling of Money and Currencies. It supports easy pluggable bank objects for customized exchange strategies. Can be used as composite in ActiveRecord tables.'
  s.has_rdoc = true

  s.files = %w(
    README
    MIT-LICENSE
    lib/money.rb
    lib/money/core_extensions.rb
    lib/money/bank/no_exchange_bank.rb
    lib/money/bank/variable_exchange_bank.rb
    lib/money/rails.rb
    lib/support/cattr_accessor.rb
  )

  s.require_path = 'lib'
  s.authors = ["Brandon Keepers", "Tobias Luetke"]
  s.email = "brandon@opensoul.org"
  s.homepage = "http://github.com/collectiveidea/money"
end
