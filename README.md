# Motion::Xib

This gem simply adds a new Rake task to RubyMotion projects to create a new Xib file from a template or edit an existing one.

## Installation

Add this line to your application's Gemfile:

    gem 'motion-xib'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-xib

## Usage

Run:
    rake xib

Within your RubyMotion project and it will give you the option to create a new Xib file in your resources folder (using the "n" option), or to edit an existing Xib using XCode.  This is a very simple gem, but hey, I like launching things from the command line and it's a first RubyMotion compatible gem.

You can then use the Xib within your controller like this:

    def loadView
        views = NSBundle.mainBundle.loadNibNamed "fbib", owner:self, options:nil
        self.view = views[0]
    end

    def viewDidLoad
        @button = view.viewWithTag 1
        @button.addTarget(self, action:'plusTapped:', forControlEvents:UIControlEventTouchUpInside)
    end

    def plusTapped(sender)
      # ... do whatever ...
    end

Make sure all the elements you want to hookup, have a tag.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
