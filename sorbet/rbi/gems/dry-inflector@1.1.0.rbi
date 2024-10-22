# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `dry-inflector` gem.
# Please instead update this file by running `bin/tapioca gem dry-inflector`.


# source://dry-inflector//lib/dry/inflector.rb#3
module Dry
  class << self
    # source://dry-configurable/1.2.0/lib/dry/configurable.rb#11
    def Configurable(**options); end

    # source://dry-core/1.0.1/lib/dry/core.rb#52
    def Equalizer(*keys, **options); end

    # source://dry-struct/1.6.0/lib/dry/struct.rb#30
    def Struct(attributes = T.unsafe(nil), &block); end

    # source://dry-types/1.7.2/lib/dry/types.rb#253
    def Types(*namespaces, default: T.unsafe(nil), **aliases); end
  end
end

# dry-inflector
#
# @since 0.1.0
#
# source://dry-inflector//lib/dry/inflector.rb#7
class Dry::Inflector
  # Instantiate the inflector
  #
  # @example Basic usage
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  # @example Custom inflection rules
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new do |inflections|
  #   inflections.plural      "virus",   "viruses" # specify a rule for #pluralize
  #   inflections.singular    "thieves", "thief"   # specify a rule for #singularize
  #   inflections.uncountable "dry-inflector"      # add an exception for an uncountable word
  #   end
  # @param blk [Proc] an optional block to specify custom inflection rules
  # @return [Dry::Inflector] the inflector
  # @since 0.1.0
  # @yieldparam the [Dry::Inflector::Inflections] inflection rules
  #
  # source://dry-inflector//lib/dry/inflector.rb#33
  def initialize(&blk); end

  # Upper camelize a string
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  #   inflector.camelize_upper("data_mapper") # => "DataMapper"
  #   inflector.camelize_upper("dry/inflector") # => "Dry::Inflector"
  # @param input [String, Symbol] the input
  # @return [String] the upper camelized string
  # @since 0.1.3
  #
  # source://dry-inflector//lib/dry/inflector.rb#66
  def camelize(input); end

  # Lower camelize a string
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  #   inflector.camelize_lower("data_mapper") # => "dataMapper"
  # @param input [String, Symbol] the input
  # @return [String] the lower camelized string
  # @since 0.1.3
  #
  # source://dry-inflector//lib/dry/inflector.rb#49
  def camelize_lower(input); end

  # Upper camelize a string
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  #   inflector.camelize_upper("data_mapper") # => "DataMapper"
  #   inflector.camelize_upper("dry/inflector") # => "Dry::Inflector"
  # @param input [String, Symbol] the input
  # @return [String] the upper camelized string
  # @since 0.1.3
  #
  # source://dry-inflector//lib/dry/inflector.rb#66
  def camelize_upper(input); end

  # Classify a string
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  #   inflector.classify("books") # => "Book"
  # @param input [String, Symbol] the input
  # @return [String] the classified string
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#104
  def classify(input); end

  # Find a constant with the name specified in the argument string
  #
  # The name is assumed to be the one of a top-level constant,
  # constant scope of caller is ignored
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  #   inflector.constantize("Module")         # => Module
  #   inflector.constantize("Dry::Inflector") # => Dry::Inflector
  # @param input [String, Symbol] the input
  # @return [Class, Module] the class or module
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#88
  def constantize(input); end

  # Dasherize a string
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  #   inflector.dasherize("dry_inflector") # => "dry-inflector"
  # @param input [String, Symbol] the input
  # @return [String] the dasherized string
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#120
  def dasherize(input); end

  # Demodulize a string
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  #   inflector.demodulize("Dry::Inflector") # => "Inflector"
  # @param input [String, Symbol] the input
  # @return [String] the demodulized string
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#136
  def demodulize(input); end

  # Creates a foreign key name
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  #   inflector.foreign_key("Message") => "message_id"
  # @param input [String, Symbol] the input
  # @return [String] foreign key
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#175
  def foreign_key(input); end

  # Humanize a string
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  #   inflector.humanize("dry_inflector") # => "Dry inflector"
  #   inflector.humanize("author_id")     # => "Author"
  # @param input [String, Symbol] the input
  # @return [String] the humanized string
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#153
  def humanize(input); end

  # @api public
  # @return [String]
  # @since 0.2.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#310
  def inspect; end

  # Ordinalize a number
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  #   inflector.ordinalize(1)  # => "1st"
  #   inflector.ordinalize(2)  # => "2nd"
  #   inflector.ordinalize(3)  # => "3rd"
  #   inflector.ordinalize(10) # => "10th"
  #   inflector.ordinalize(23) # => "23rd"
  # @param number [Integer] the input
  # @return [String] the ordinalized number
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#195
  def ordinalize(number); end

  # Pluralize a string
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  #   inflector.pluralize("book")  # => "books"
  #   inflector.pluralize("money") # => "money"
  # @param input [String, Symbol] the input
  # @return [String] the pluralized string
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#223
  def pluralize(input); end

  # Singularize a string
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  #   inflector.singularize("books") # => "book"
  #   inflector.singularize("money") # => "money"
  # @param input [String] the input
  # @return [String] the singularized string
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#243
  def singularize(input); end

  # Tableize a string
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  #   inflector.tableize("Book") # => "books"
  # @param input [String, Symbol] the input
  # @return [String] the tableized string
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#262
  def tableize(input); end

  # @api public
  # @return [String]
  # @since 0.2.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#310
  def to_s; end

  # Check if the input is an uncountable word
  #
  # @api private
  # @param input [String] the input
  # @return [TrueClass, FalseClass] the result of the check
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#300
  def uncountable?(input); end

  # Underscore a string
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new
  #   inflector.underscore("dry-inflector") # => "dry_inflector"
  # @param input [String, Symbol] the input
  # @return [String] the underscored string
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#279
  def underscore(input); end

  private

  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector.rb#325
  def inflections; end

  # @api private
  # @since 0.1.3
  #
  # source://dry-inflector//lib/dry/inflector.rb#329
  def internal_camelize(input, upper); end
end

# A set of acronyms
#
# @api private
# @since 0.1.2
#
# source://dry-inflector//lib/dry/inflector/acronyms.rb#9
class Dry::Inflector::Acronyms
  # @api private
  # @return [Acronyms] a new instance of Acronyms
  # @since 0.1.2
  #
  # source://dry-inflector//lib/dry/inflector/acronyms.rb#14
  def initialize; end

  # @api private
  # @since 0.1.2
  #
  # source://dry-inflector//lib/dry/inflector/acronyms.rb#27
  def add(rule, replacement); end

  # @api private
  # @since 0.1.2
  #
  # source://dry-inflector//lib/dry/inflector/acronyms.rb#21
  def apply_to(word, capitalize: T.unsafe(nil)); end

  # @api private
  # @since 0.1.2
  #
  # source://dry-inflector//lib/dry/inflector/acronyms.rb#10
  def regex; end

  private

  # @api private
  # @since 0.1.2
  #
  # source://dry-inflector//lib/dry/inflector/acronyms.rb#36
  def define_regex_patterns; end
end

# @api private
# @since 0.1.2
#
# source://dry-inflector//lib/dry/inflector.rb#323
Dry::Inflector::DEFAULT_SEPARATOR = T.let(T.unsafe(nil), String)

# Inflections
#
# @since 0.1.0
#
# source://dry-inflector//lib/dry/inflector/inflections.rb#12
class Dry::Inflector::Inflections
  # Instantiate the rules
  #
  # @api private
  # @return [Dry::Inflector::Inflections]
  # @since 0.1.0
  # @yieldparam [self]
  #
  # source://dry-inflector//lib/dry/inflector/inflections.rb#76
  def initialize; end

  # Add one or more acronyms
  #
  # Acronyms affect how basic operations are performed, such
  # as camelize/underscore.
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new do |inflections|
  #   inflections.acronym "HTML"
  #   end
  #
  #   inflector.camelize("html")        # => "HTML"
  #   inflector.underscore("HTMLIsFun") # => "html_is_fun"
  # @param words [Array<String>] a list of acronyms
  # @since 0.1.2
  #
  # source://dry-inflector//lib/dry/inflector/inflections.rb#197
  def acronym(*words); end

  # Acronyms
  #
  # @api private
  # @return [Dry::Inflector::Acronyms]
  # @since 0.1.2
  #
  # source://dry-inflector//lib/dry/inflector/inflections.rb#67
  def acronyms; end

  # Add a custom humanize rule
  #
  # Specifies a humanized form of a string by a regular expression rule or
  # by a string mapping.
  #
  # When using a regular expression based replacement, the normal humanize
  # formatting is called after the replacement.
  #
  # When a string is used, the human form should be specified as desired
  # (example: `"The name"`, not `"the_name"`)
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new do |inflections|
  #   inflections.human(/_cnt$/i, '\1_count')
  #   inflections.human("legacy_col_person_name", "Name")
  #   end
  # @param rule [String, Regexp] the rule
  # @param replacement [String] the replacement
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/inflections.rb#224
  def human(rule, replacement); end

  # Human rules
  #
  # @api private
  # @return [Dry::Inflector::Rules]
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/inflections.rb#59
  def humans; end

  # Add a custom pluralization rule
  #
  # Specifies a new irregular that applies to both pluralization
  # and singularization at the same time.
  #
  # This can only be used for strings, not regular expressions.
  # You simply pass the irregular in singular and plural form.
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new do |inflections|
  #   inflections.singular "octopus", "octopi"
  #   end
  # @param singular [String] the singular
  # @param plural [String] the plural
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/inflections.rb#151
  def irregular(singular, plural); end

  # Add a custom pluralization rule
  #
  # Specifies a new pluralization rule and its replacement.
  # The rule can either be a string or a regular expression.
  #
  # The replacement should always be a string that may include
  # references to the matched data from the rule.
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new do |inflections|
  #   inflections.plural "virus", "viruses"
  #   end
  # @param rule [String, Regexp] the rule
  # @param replacement [String] the replacement
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/inflections.rb#105
  def plural(rule, replacement); end

  # Pluralization rules
  #
  # @api private
  # @return [Dry::Inflector::Rules]
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/inflections.rb#35
  def plurals; end

  # Add a custom singularization rule
  #
  # Specifies a new singularization rule and its replacement.
  # The rule can either be a string or a regular expression.
  #
  # The replacement should always be a string that may include
  # references to the matched data from the rule.
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new do |inflections|
  #   inflections.singular "thieves", "thief"
  #   end
  # @param rule [String, Regexp] the rule
  # @param replacement [String] the replacement
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/inflections.rb#128
  def singular(rule, replacement); end

  # Singularization rules
  #
  # @api private
  # @return [Dry::Inflector::Rules]
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/inflections.rb#43
  def singulars; end

  # Add a custom rule for uncountable words
  #
  # Uncountable will not be inflected
  #
  # @example
  #   require "dry/inflector"
  #
  #   inflector = Dry::Inflector.new do |inflections|
  #   inflections.uncountable "money"
  #   inflections.uncountable "money", "information"
  #   inflections.uncountable %w(money information rice)
  #   end
  # @param words [Enumerable<String>]
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/inflections.rb#175
  def uncountable(*words); end

  # Uncountable rules
  #
  # @api private
  # @return [Set]
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/inflections.rb#51
  def uncountables; end

  private

  # Add irregular inflection
  #
  # @api private
  # @param rule [String] the rule
  # @param replacement [String] the replacement
  # @return [undefined]
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/inflections.rb#239
  def add_irregular(rule, replacement, target); end

  # Add a new rule
  #
  # @api private
  # @param rule [String, Regexp] the rule
  # @param replacement [String, Regexp] the replacement
  # @param target [Dry::Inflector::Rules] the target
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/inflections.rb#252
  def rule(rule, replacement, target); end

  class << self
    # Instantiate a set of inflection rules.
    # It adds the default rules and the optional customizations, passed as a block.
    #
    # @api private
    # @param blk [Proc] the optional, custom rules
    # @since 0.1.0
    #
    # source://dry-inflector//lib/dry/inflector/inflections.rb#22
    def build(&blk); end
  end
end

# Default inflections
#
#
# @api private
# @since 0.1.0
#
# source://dry-inflector//lib/dry/inflector/inflections/defaults.rb#12
module Dry::Inflector::Inflections::Defaults
  class << self
    # @api private
    # @since 0.1.0
    #
    # source://dry-inflector//lib/dry/inflector/inflections/defaults.rb#15
    def call(inflect); end

    private

    # @api private
    # @since 0.1.2
    #
    # source://dry-inflector//lib/dry/inflector/inflections/defaults.rb#112
    def acronyms(inflect); end

    # @api private
    # @since 0.1.0
    #
    # source://dry-inflector//lib/dry/inflector/inflections/defaults.rb#87
    def irregular(inflect); end

    # @api private
    # @since 0.1.0
    #
    # source://dry-inflector//lib/dry/inflector/inflections/defaults.rb#25
    def plural(inflect); end

    # @api private
    # @since 0.1.0
    #
    # source://dry-inflector//lib/dry/inflector/inflections/defaults.rb#55
    def singular(inflect); end

    # @api private
    # @since 0.1.0
    #
    # source://dry-inflector//lib/dry/inflector/inflections/defaults.rb#105
    def uncountable(inflect); end
  end
end

# @api private
# @since 0.1.0
#
# source://dry-inflector//lib/dry/inflector.rb#319
Dry::Inflector::ORDINALIZE_TH = T.let(T.unsafe(nil), Hash)

# A set of inflection rules
#
# @api private
# @since 0.1.0
#
# source://dry-inflector//lib/dry/inflector/rules.rb#9
class Dry::Inflector::Rules
  # @api private
  # @return [Rules] a new instance of Rules
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/rules.rb#12
  def initialize; end

  # @api private
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/rules.rb#18
  def apply_to(word); end

  # @api private
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/rules.rb#32
  def each(&blk); end

  # @api private
  # @since 0.1.0
  #
  # source://dry-inflector//lib/dry/inflector/rules.rb#26
  def insert(index, array); end
end

# @since 0.1.0
#
# source://dry-inflector//lib/dry/inflector/version.rb#6
Dry::Inflector::VERSION = T.let(T.unsafe(nil), String)