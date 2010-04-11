module GamesHelper
  def secret_board()
    my_html = ""
    @secret_word.split("").each { |symb|
      my_html << '<td>'
       if @round.has_symbol(symb)
         my_html << symb.to_s
       else
        my_html << '_'
       end
      my_html << '</td>'
       }
     my_html
  end
  def zmur

    res = '<div width="100%">'
    if @miss_count > 0
      res << image_tag( 'zhmur_head.jpg', :allign => 'center' )
    end
    res << '</div>'
    res << "<div width='100%'>"
    if @miss_count > 1
      res << image_tag('zhmur_left_arm.jpg')
    end
    if @miss_count > 2
      res << image_tag('zhmur_body.jpg')
    end
    if @miss_count > 3
      res << image_tag( 'zhmur_right_arm.jpg')
    end
    res << '</div>'
    res << "<div width='100%'>"
      if @miss_count > 4
        res << image_tag( 'zhmur_left_leg.jpg')
      end
      if @miss_count > 5
        res << image_tag( 'zhmur_right_leg.jpg')
      end
    res << '</div>'
    res
  end
end
