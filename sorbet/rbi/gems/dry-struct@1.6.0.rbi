# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `dry-struct` gem.
# Please instead update this file by running `bin/tapioca gem dry-struct`.


# source://dry-struct//lib/dry/struct/class_interface.rb#5
module Dry
  class << self
    # source://dry-configurable/1.2.0/lib/dry/configurable.rb#11
    def Configurable(**options); end

    # source://dry-core/1.0.1/lib/dry/core.rb#52
    def Equalizer(*keys, **options); end

    # Constructor method for easily creating a {Dry::Struct}.
    #
    # @example
    #   require 'dry-struct'
    #
    #   module Types
    #   include Dry.Types()
    #   end
    #
    #   Person = Dry.Struct(name: Types::String, age: Types::Integer)
    #   matz = Person.new(name: "Matz", age: 52)
    #   matz.name #=> "Matz"
    #   matz.age #=> 52
    #
    #   Test = Dry.Struct(expected: Types::String) { schema(schema.strict) }
    #   Test[expected: "foo", unexpected: "bar"]
    #   #=> Dry::Struct::Error: [Test.new] unexpected keys [:unexpected] in Hash input
    # @return [Dry::Struct]
    #
    # source://dry-struct//lib/dry/struct.rb#30
    def Struct(attributes = T.unsafe(nil), &block); end

    # source://dry-types/1.7.2/lib/dry/types.rb#253
    def Types(*namespaces, default: T.unsafe(nil), **aliases); end
  end
end

# Typed {Struct} with virtus-like DSL for defining schema.
#
# ### Differences between dry-struct and virtus
#
# {Struct} look somewhat similar to [Virtus][] but there are few significant differences:
#
# * {Struct}s don't provide attribute writers and are meant to be used
#   as "data objects" exclusively.
# * Handling of attribute values is provided by standalone type objects from
#   [`dry-types`][].
# * Handling of attribute hashes is provided by standalone hash schemas from
#   [`dry-types`][].
# * Struct classes quack like [`dry-types`][], which means you can use them
#   in hash schemas, as array members or sum them
#
# {Struct} class can specify a constructor type, which uses [hash schemas][]
# to handle attributes in `.new` method.
#
# [`dry-types`]: https://github.com/dry-rb/dry-types
# [Virtus]: https://github.com/solnic/virtus
# [hash schemas]: http://dry-rb.org/gems/dry-types/hash-schemas
#
# @example
#   require 'dry-struct'
#
#   module Types
#   include Dry.Types()
#   end
#
#   class Book < Dry::Struct
#   attribute :title, Types::String
#   attribute :subtitle, Types::String.optional
#   end
#
#   rom_n_roda = Book.new(
#   title: 'Web Development with ROM and Roda',
#   subtitle: nil
#   )
#   rom_n_roda.title #=> 'Web Development with ROM and Roda'
#   rom_n_roda.subtitle #=> nil
#
#   refactoring = Book.new(
#   title: 'Refactoring',
#   subtitle: 'Improving the Design of Existing Code'
#   )
#   refactoring.title #=> 'Refactoring'
#   refactoring.subtitle #=> 'Improving the Design of Existing Code'
#
# source://dry-struct//lib/dry/struct/class_interface.rb#6
class Dry::Struct
  include ::Dry::Core::Constants
  include ::Dry::Core::Equalizer::Methods
  extend ::Dry::Core::Extensions
  extend ::Dry::Core::Constants
  extend ::Dry::Core::ClassAttributes
  extend ::Dry::Types::Type
  extend ::Dry::Types::Builder
  extend ::Dry::Struct::ClassInterface
  extend ::Dry::Core::Deprecations::Interface

  # @param attributes [Hash, #each]
  # @return [Struct] a new instance of Struct
  #
  # source://dry-struct//lib/dry/struct.rb#126
  def initialize(attributes); end

  # Retrieves value of previously defined attribute by its' `name`
  #
  # @example
  #   class Book < Dry::Struct
  #   attribute :title, Types::String
  #   attribute :subtitle, Types::String.optional
  #   end
  #
  #   rom_n_roda = Book.new(
  #   title: 'Web Development with ROM and Roda',
  #   subtitle: nil
  #   )
  #   rom_n_roda[:title] #=> 'Web Development with ROM and Roda'
  #   rom_n_roda[:subtitle] #=> nil
  # @param name [String]
  # @return [Object]
  #
  # source://dry-struct//lib/dry/struct.rb#147
  def [](name); end

  # Returns the value of attribute attributes.
  #
  # source://dry-struct//lib/dry/struct.rb#122
  def __attributes__; end

  # Create a copy of {Dry::Struct} with overriden attributes
  #
  # @example
  #   class Book < Dry::Struct
  #   attribute :title, Types::String
  #   attribute :subtitle, Types::String.optional
  #   end
  #
  #   rom_n_roda = Book.new(
  #   title: 'Web Development with ROM and Roda',
  #   subtitle: '2nd edition'
  #   )
  #   #=> #<Book title="Web Development with ROM and Roda" subtitle="2nd edition">
  #
  #   rom_n_roda.new(subtitle: '3rd edition')
  #   #=> #<Book title="Web Development with ROM and Roda" subtitle="3rd edition">
  # @param changeset [Hash{Symbol => Object}]
  # @return [Struct]
  #
  # source://dry-struct//lib/dry/struct.rb#196
  def __new__(changeset); end

  # Returns the value of attribute attributes.
  #
  # source://dry-struct//lib/dry/struct.rb#122
  def attributes; end

  # Pattern matching support
  #
  # @api private
  #
  # source://dry-struct//lib/dry/struct.rb#218
  def deconstruct_keys(_keys); end

  # @return [String]
  #
  # source://dry-struct//lib/dry/struct.rb#209
  def inspect; end

  # Create a copy of {Dry::Struct} with overriden attributes
  #
  # @example
  #   class Book < Dry::Struct
  #   attribute :title, Types::String
  #   attribute :subtitle, Types::String.optional
  #   end
  #
  #   rom_n_roda = Book.new(
  #   title: 'Web Development with ROM and Roda',
  #   subtitle: '2nd edition'
  #   )
  #   #=> #<Book title="Web Development with ROM and Roda" subtitle="2nd edition">
  #
  #   rom_n_roda.new(subtitle: '3rd edition')
  #   #=> #<Book title="Web Development with ROM and Roda" subtitle="3rd edition">
  # @param changeset [Hash{Symbol => Object}]
  # @return [Struct]
  #
  # source://dry-struct//lib/dry/struct.rb#196
  def new(changeset); end

  # Converts the {Dry::Struct} to a hash with keys representing
  # each attribute (as symbols) and their corresponding values
  #
  # @example
  #   class Book < Dry::Struct
  #   attribute :title, Types::String
  #   attribute :subtitle, Types::String.optional
  #   end
  #
  #   rom_n_roda = Book.new(
  #   title: 'Web Development with ROM and Roda',
  #   subtitle: nil
  #   )
  #   rom_n_roda.to_hash
  #   #=> {title: 'Web Development with ROM and Roda', subtitle: nil}
  # @return [Hash{Symbol => Object}]
  #
  # source://dry-struct//lib/dry/struct.rb#168
  def to_h; end

  # Converts the {Dry::Struct} to a hash with keys representing
  # each attribute (as symbols) and their corresponding values
  # TODO: remove in 2.0
  #
  # @example
  #   class Book < Dry::Struct
  #   attribute :title, Types::String
  #   attribute :subtitle, Types::String.optional
  #   end
  #
  #   rom_n_roda = Book.new(
  #   title: 'Web Development with ROM and Roda',
  #   subtitle: nil
  #   )
  #   rom_n_roda.to_hash
  #   #=> {title: 'Web Development with ROM and Roda', subtitle: nil}
  # @return [Hash{Symbol => Object}]
  #
  # source://dry-struct//lib/dry/struct.rb#168
  def to_hash; end

  class << self
    # source://dry-struct//lib/dry/struct.rb#94
    def loader; end

    def prepend(*_arg0); end
  end
end

# Class-level interface of {Struct} and {Value}
#
# source://dry-struct//lib/dry/struct/class_interface.rb#8
module Dry::Struct::ClassInterface
  include ::Dry::Core::Constants
  include ::Dry::Core::ClassAttributes
  include ::Dry::Types::Type
  include ::Dry::Types::Builder

  # @param other [Object, Dry::Struct]
  # @return [Boolean]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#349
  def ===(other); end

  # Make the struct abstract. This class will be used as a default
  # parent class for nested structs
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#415
  def abstract; end

  # Adds an attribute for this {Struct} with given `name` and `type`
  # and modifies {.schema} accordingly.
  #
  # @example with nested structs
  #   class Language < Dry::Struct
  #   attribute :name, Types::String
  #   attribute :details, Dry::Struct do
  #   attribute :type, Types::String
  #   end
  #   end
  #
  #   Language.schema # new lines for readability
  #   # => #<Dry::Types[
  #   Constructor<Schema<keys={
  #   name: Constrained<Nominal<String> rule=[type?(String)]>
  #   details: Language::Details
  #   }> fn=Kernel.Hash>]>
  #
  #   ruby = Language.new(name: 'Ruby', details: { type: 'OO' })
  #   ruby.name #=> 'Ruby'
  #   ruby.details #=> #<Language::Details type="OO">
  #   ruby.details.type #=> 'OO'
  # @example with a nested array of structs
  #   class Language < Dry::Struct
  #   attribute :name, Types::String
  #   attribute :versions, Types::Array.of(Types::String)
  #   attribute :celebrities, Types::Array.of(Dry::Struct) do
  #   attribute :name, Types::String
  #   attribute :pseudonym, Types::String
  #   end
  #   end
  #
  #   Language.schema # new lines for readability
  #   => #<Dry::Types[Constructor<Schema<keys={
  #   name: Constrained<Nominal<String> rule=[type?(String)]>
  #   versions: Constrained<
  #   Array<Constrained<Nominal<String> rule=[type?(String)]>
  #   > rule=[type?(Array)]>
  #   celebrities: Constrained<Array<Language::Celebrity> rule=[type?(Array)]>
  #   }> fn=Kernel.Hash>]>
  #
  #   ruby = Language.new(
  #   name: 'Ruby',
  #   versions: %w(1.8.7 1.9.8 2.0.1),
  #   celebrities: [
  #   { name: 'Yukihiro Matsumoto', pseudonym: 'Matz' },
  #   { name: 'Aaron Patterson', pseudonym: 'tenderlove' }
  #   ]
  #   )
  #   ruby.name #=> 'Ruby'
  #   ruby.versions #=> ['1.8.7', '1.9.8', '2.0.1']
  #   ruby.celebrities
  #   #=> [
  #   #<Language::Celebrity name='Yukihiro Matsumoto' pseudonym='Matz'>,
  #   #<Language::Celebrity name='Aaron Patterson' pseudonym='tenderlove'>
  #   ]
  #   ruby.celebrities[0].name #=> 'Yukihiro Matsumoto'
  #   ruby.celebrities[0].pseudonym #=> 'Matz'
  #   ruby.celebrities[1].name #=> 'Aaron Patterson'
  #   ruby.celebrities[1].pseudonym #=> 'tenderlove'
  # @param name [Symbol] name of the defined attribute
  # @param type [Dry::Types::Type, nil] or superclass of nested type
  # @raise [RepeatedAttributeError] when trying to define attribute with the
  #   same name as previously defined one
  # @return [Dry::Struct]
  # @yield If a block is given, it will be evaluated in the context of
  #   a new struct class, and set as a nested type for the given
  #   attribute. A class with a matching name will also be defined for
  #   the nested type.
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#95
  def attribute(name, type = T.unsafe(nil), &block); end

  # Adds an omittable (key is not required on initialization) attribute for this {Struct}
  #
  # @example
  #   class User < Dry::Struct
  #   attribute  :name,  Types::String
  #   attribute? :email, Types::String
  #   end
  #
  #   User.new(name: 'John') # => #<User name="John" email=nil>
  # @param name [Symbol] name of the defined attribute
  # @param type [Dry::Types::Type, nil] or superclass of nested type
  # @return [Dry::Struct]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#148
  def attribute?(*args, &block); end

  # Gets the list of attribute names
  #
  # @return [Array<Symbol>]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#385
  def attribute_names; end

  # @example
  #   class Book < Dry::Struct
  #   attributes(
  #   title: Types::String,
  #   author: Types::String
  #   )
  #   end
  #
  #   Book.schema
  #   # => #<Dry::Types[Constructor<Schema<keys={
  #   #      title: Constrained<Nominal<String> rule=[type?(String)]>
  #   #      author: Constrained<Nominal<String> rule=[type?(String)]>
  #   #    }> fn=Kernel.Hash>]>
  # @param new_schema [Hash{Symbol => Dry::Types::Type}]
  # @raise [RepeatedAttributeError] when trying to define attribute with the
  #   same name as previously defined one
  # @return [Dry::Struct]
  # @see #attribute
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#182
  def attributes(new_schema); end

  # Add atributes from another struct
  #
  # @example
  #   class Address < Dry::Struct
  #   attribute :city, Types::String
  #   attribute :country, Types::String
  #   end
  #
  #   class User < Dry::Struct
  #   attribute :name, Types::String
  #   attributes_from Address
  #   end
  #
  #   User.new(name: 'Quispe', city: 'La Paz', country: 'Bolivia')
  # @example with nested structs
  #   class User < Dry::Struct
  #   attribute :name, Types::String
  #   attribute :address do
  #   attributes_from Address
  #   end
  #   end
  # @param struct [Dry::Struct]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#123
  def attributes_from(struct); end

  # @api private
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#271
  def call_safe(input, &block); end

  # @api private
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#280
  def call_unsafe(input); end

  # @return [true]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#355
  def constrained?; end

  # @param constructor [#call, nil]
  # @param block [#call, nil]
  # @return [Dry::Struct::Constructor]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#298
  def constructor(constructor = T.unsafe(nil), **_arg1, &block); end

  # @return [false]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#343
  def default?; end

  # @param args [({Symbol => Object})]
  # @return [Dry::Types::Result::Failure]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#332
  def failure(*args); end

  # Checks if this {Struct} has the given attribute
  #
  # @param key [Symbol] Attribute name
  # @return [Boolean]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#378
  def has_attribute?(key); end

  # @param klass [Class]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#15
  def inherited(klass); end

  # @api private
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#289
  def load(attributes); end

  # @return [{Symbol => Object}]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#390
  def meta(meta = T.unsafe(nil)); end

  # @param attributes [Hash{Symbol => Object}, Dry::Struct]
  # @raise [Struct::Error] if the given attributes don't conform {#schema}
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#249
  def new(attributes = T.unsafe(nil), safe = T.unsafe(nil), &block); end

  # @return [false]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#365
  def optional?; end

  # @return [self]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#360
  def primitive; end

  # @param other [Object, Dry::Struct]
  # @return [Boolean]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#349
  def primitive?(other); end

  # @param klass [Class]
  # @param args [({Symbol => Object})]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#338
  def result(klass, *args); end

  # @param args [({Symbol => Object})]
  # @return [Dry::Types::Result::Success]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#326
  def success(*args); end

  # Dump to the AST
  #
  # @api public
  # @return [Array]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#424
  def to_ast(meta: T.unsafe(nil)); end

  # @return [Proc]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#370
  def to_proc; end

  # Add an arbitrary transformation for input hash keys.
  #
  # @example
  #   class Book < Dry::Struct
  #   transform_keys(&:to_sym)
  #
  #   attribute :title, Types::String
  #   end
  #
  #   Book.new('title' => "The Old Man and the Sea")
  #   # => #<Book title="The Old Man and the Sea">
  # @param proc [#call, nil]
  # @param block [#call, nil]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#231
  def transform_keys(proc = T.unsafe(nil), &block); end

  # Add an arbitrary transformation for new attribute types.
  #
  # @example
  #   class Book < Dry::Struct
  #   transform_types { |t| t.meta(struct: :Book) }
  #
  #   attribute :title, Types::String
  #   end
  #
  #   Book.schema.key(:title).meta # => { struct: :Book }
  # @param proc [#call, nil]
  # @param block [#call, nil]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#214
  def transform_types(proc = T.unsafe(nil), &block); end

  # @param input [Hash{Symbol => Object}, Dry::Struct]
  # @return [Dry::Types::Result]
  # @yieldparam failure [Dry::Types::Result::Failure]
  # @yieldreturn [Dry::Types::Result]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#306
  def try(input); end

  # @param input [Hash{Symbol => Object}, Dry::Struct]
  # @private
  # @return [Dry::Types::Result]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#316
  def try_struct(input); end

  # Build a sum type
  #
  # @param type [Dry::Types::Type]
  # @return [Dry::Types::Sum]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#405
  def |(type); end

  private

  # Constructs a type
  #
  # @return [Dry::Types::Type, Dry::Struct]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#458
  def build_type(name, type = T.unsafe(nil), &block); end

  # @param new_keys [Hash{Symbol => Dry::Types::Type, Dry::Struct}]
  # @raise [RepeatedAttributeError] when trying to define attribute with the
  #   same name as previously defined one
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#238
  def check_schema_duplication(new_keys); end

  # Retrieves default attributes from defined {.schema}.
  # Used in a {Struct} constructor if no attributes provided to {.new}
  #
  # @return [Hash{Symbol => Object}]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#439
  def default_attributes(default_schema = T.unsafe(nil)); end

  # source://dry-struct//lib/dry/struct/class_interface.rb#479
  def define_accessors(keys); end

  # Checks if the given type is a Dry::Struct
  #
  # @param type [Dry::Types::Type]
  # @return [Boolean]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#450
  def struct?(type); end

  # Stores an object for building nested struct classes
  #
  # @return [StructBuilder]
  #
  # source://dry-struct//lib/dry/struct/class_interface.rb#430
  def struct_builder; end
end

# source://dry-struct//lib/dry/struct/compiler.rb#5
class Dry::Struct::Compiler < ::Dry::Types::Compiler
  # source://dry-struct//lib/dry/struct/compiler.rb#6
  def visit_struct(node); end
end

# source://dry-struct//lib/dry/struct/constructor.rb#5
class Dry::Struct::Constructor < ::Dry::Types::Constructor
  # source://dry-types/1.7.2/lib/dry/types/constructor.rb#16
  def primitive; end
end

# Raised when given input doesn't conform schema and constructor type
#
# source://dry-struct//lib/dry/struct/errors.rb#6
class Dry::Struct::Error < ::TypeError; end

# Helper for {Struct#to_hash} implementation
#
# source://dry-struct//lib/dry/struct/hashify.rb#6
module Dry::Struct::Hashify
  class << self
    # Converts value to hash recursively
    #
    # @param value [#to_hash, #map, Object]
    # @return [Hash, Array]
    #
    # source://dry-struct//lib/dry/struct/hashify.rb#10
    def [](value); end
  end
end

# Raised when a struct doesn't have an attribute
#
# source://dry-struct//lib/dry/struct/errors.rb#18
class Dry::Struct::MissingAttributeError < ::KeyError
  # @return [MissingAttributeError] a new instance of MissingAttributeError
  #
  # source://dry-struct//lib/dry/struct/errors.rb#19
  def initialize(key); end
end

# When struct class stored in ast was garbage collected because no alive objects exists
# This shouldn't happen in a working application
#
# source://dry-struct//lib/dry/struct/errors.rb#26
class Dry::Struct::RecycledStructError < ::RuntimeError
  # @return [RecycledStructError] a new instance of RecycledStructError
  #
  # source://dry-struct//lib/dry/struct/errors.rb#27
  def initialize; end
end

# Raised when defining duplicate attributes
#
# source://dry-struct//lib/dry/struct/errors.rb#9
class Dry::Struct::RepeatedAttributeError < ::ArgumentError
  # @param key [Symbol] attribute name that is the same as previously defined one
  # @return [RepeatedAttributeError] a new instance of RepeatedAttributeError
  #
  # source://dry-struct//lib/dry/struct/errors.rb#12
  def initialize(key); end
end

# @private
#
# source://dry-struct//lib/dry/struct/struct_builder.rb#6
class Dry::Struct::StructBuilder < ::Dry::Struct::Compiler
  # @return [StructBuilder] a new instance of StructBuilder
  #
  # source://dry-struct//lib/dry/struct/struct_builder.rb#9
  def initialize(struct); end

  # @param attr_name [Symbol|String] the name of the nested type
  # @param type [Dry::Struct, Dry::Types::Type::Array, Undefined] the superclass
  #   of the nested struct
  # @yield the body of the nested struct
  #
  # source://dry-struct//lib/dry/struct/struct_builder.rb#18
  def call(attr_name, type, &block); end

  # Returns the value of attribute struct.
  #
  # source://dry-struct//lib/dry/struct/struct_builder.rb#7
  def struct; end

  private

  # @return [Boolean]
  #
  # source://dry-struct//lib/dry/struct/struct_builder.rb#50
  def array?(type); end

  # source://dry-struct//lib/dry/struct/struct_builder.rb#79
  def check_name(name); end

  # source://dry-struct//lib/dry/struct/struct_builder.rb#68
  def const_name(type, attr_name); end

  # @return [Boolean]
  #
  # source://dry-struct//lib/dry/struct/struct_builder.rb#54
  def optional?(type); end

  # source://dry-struct//lib/dry/struct/struct_builder.rb#58
  def parent(type); end

  # @return [Boolean]
  #
  # source://dry-struct//lib/dry/struct/struct_builder.rb#46
  def type?(type); end

  # source://dry-struct//lib/dry/struct/struct_builder.rb#93
  def visit_array(node); end

  # source://dry-struct//lib/dry/struct/struct_builder.rb#88
  def visit_constrained(node); end

  # source://dry-struct//lib/dry/struct/struct_builder.rb#102
  def visit_constructor(node); end

  # source://dry-struct//lib/dry/struct/struct_builder.rb#98
  def visit_nominal(*_arg0); end
end

# A sum type of two or more structs
# As opposed to Dry::Types::Sum::Constrained
# this type tries no to coerce data first.
#
# source://dry-struct//lib/dry/struct/sum.rb#8
class Dry::Struct::Sum < ::Dry::Types::Sum::Constrained
  # @return [boolean]
  #
  # source://dry-struct//lib/dry/struct/sum.rb#39
  def ===(value); end

  # source://dry-struct//lib/dry/struct/sum.rb#9
  def call(input); end

  # @param input [Hash{Symbol => Object}, Dry::Struct]
  # @return [Dry::Types::Result]
  # @yieldparam failure [Dry::Types::Result::Failure]
  # @yieldreturn [Dry::Types::Result]
  #
  # source://dry-struct//lib/dry/struct/sum.rb#19
  def try(input); end

  # Build a new sum type
  #
  # @param type [Dry::Types::Type]
  # @return [Dry::Types::Sum]
  #
  # source://dry-struct//lib/dry/struct/sum.rb#30
  def |(type); end

  protected

  # @private
  #
  # source://dry-struct//lib/dry/struct/sum.rb#46
  def try_struct(input, &block); end
end

# @private
#
# source://dry-struct//lib/dry/struct/version.rb#6
Dry::Struct::VERSION = T.let(T.unsafe(nil), String)

# {Value} objects behave like {Struct}s but *deeply frozen*
# using [`ice_nine`](https://github.com/dkubb/ice_nine)
#
# @example
#   class Location < Dry::Struct::Value
#   attribute :lat, Types::Float
#   attribute :lng, Types::Float
#   end
#
#   loc1 = Location.new(lat: 1.23, lng: 4.56)
#   loc2 = Location.new(lat: 1.23, lng: 4.56)
#
#   loc1.frozen? #=> true
#   loc2.frozen? #=> true
#   loc1 == loc2 #=> true
# @see https://github.com/dkubb/ice_nine
#
# source://dry-struct//lib/dry/struct/value.rb#26
class Dry::Struct::Value < ::Dry::Struct
  class << self
    # @param attributes [Hash{Symbol => Object}, Dry::Struct]
    # @return [Value]
    # @see https://github.com/dkubb/ice_nine
    #
    # source://dry-struct//lib/dry/struct/value.rb#32
    def new(*_arg0); end
  end
end

# source://dry-struct//lib/dry/struct/printer.rb#6
module Dry::Types
  extend ::Dry::Core::Constants

  class << self
    # source://dry-types/1.7.2/lib/dry/types/constraints.rb#13
    def Rule(options); end

    # source://dry-types/1.7.2/lib/dry/types.rb#115
    def [](name); end

    # source://dry-types/1.7.2/lib/dry/types.rb#163
    def const_missing(const); end

    # source://dry-types/1.7.2/lib/dry/types.rb#82
    def container; end

    # source://dry-types/1.7.2/lib/dry/types.rb#197
    def define_builder(method, &block); end

    # source://dry-types/1.7.2/lib/dry/types.rb#149
    def identifier(klass); end

    # source://dry-types/1.7.2/lib/dry/types.rb#73
    def included(*_arg0); end

    # source://dry-types/1.7.2/lib/dry/types.rb#33
    def loader; end

    # source://dry-core/1.0.1/lib/dry/core/deprecations.rb#202
    def module(*args, &block); end

    # source://dry-types/1.7.2/lib/dry/types.rb#104
    def register(name, type = T.unsafe(nil), &block); end

    # source://dry-types/1.7.2/lib/dry/types.rb#91
    def registered?(class_or_identifier); end

    # source://dry-types/1.7.2/lib/dry/types/constraints.rb#26
    def rule_compiler; end

    # source://dry-types/1.7.2/lib/dry/types.rb#158
    def type_map; end
  end
end

# @api private
#
# source://dry-struct//lib/dry/struct/printer.rb#8
class Dry::Types::Printer
  # source://dry-types/1.7.2/lib/dry/types/printer.rb#38
  def initialize; end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#43
  def call(type); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#49
  def visit(type, &block); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#62
  def visit_any(_); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#66
  def visit_array(type); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#72
  def visit_array_member(array); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#155
  def visit_callable(callable); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#104
  def visit_composition(composition, &block); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#93
  def visit_constrained(constrained); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#80
  def visit_constructor(constructor); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#129
  def visit_default(default); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#110
  def visit_enum(enum); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#253
  def visit_hash(hash); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#243
  def visit_key(key); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#149
  def visit_lax(lax); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#229
  def visit_map(map); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#143
  def visit_nominal(type); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#272
  def visit_options(options, meta = T.unsafe(nil)); end

  # source://dry-types/1.7.2/lib/dry/types/printer.rb#190
  def visit_schema(schema); end

  # @api private
  #
  # source://dry-types/1.7.2/lib/dry/types/printer.rb#80
  def visit_struct_constructor(constructor); end

  # @api private
  #
  # source://dry-struct//lib/dry/struct/printer.rb#12
  def visit_struct_sum(sum); end
end
