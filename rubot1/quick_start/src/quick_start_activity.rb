require 'ruboto/widget'
require 'ruboto/util/toast'

ruboto_import_widgets :Button, :LinearLayout, :TextView

# http://xkcd.com/378/

class QuickStartActivity
  def onCreate(bundle)
    super
    set_title 'This says hi to Sam!'

    self.content_view = linear_layout :orientation => :vertical do
          @text_view = text_view :text => 'Click Below!', :id => 42, 
                                 :layout => {:width => :match_parent},
                                 :gravity => :center, :text_size => 48.0
          button :text => 'Go on! Do it Click ME!', 
                 :layout => {:width => :match_parent},
                 :id => 43, :on_click_listener => proc { butterfly }
        end
  rescue Exception
    puts "Exception creating activity: #{$!}"
    puts $!.backtrace.join("\n")
  end

  private

  def butterfly
    @text_view.text = 'Hi Sam!'
    toast 'Is that you Sammy!'
  end

end
