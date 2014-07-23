require 'calendar'

describe Calendar do
  context 'Feb 2012' do
    it 'prints the calendar' do
      calendar = Calendar.new 2012, 2, 4
      feb =
        <<-END
         February 2012
 Thu Fri Sat Sun Mon Tue Wed
                           1
   2   3   4   5   6   7   8
   9  10  11  12  13  14  15
  16  17  18  19  20  21  22
  23  24  25  26  27  28  29
      END

      expect("#{calendar}").to eq feb
    end
  end

  context 'Oct 2012' do
    it 'prints the calendar' do
      calendar = Calendar.new 2012, 10, 4
      oct =
        <<-END
         October 2012
 Thu Fri Sat Sun Mon Tue Wed
                   1   2   3
   4   5   6   7   8   9  10
  11  12  13  14  15  16  17
  18  19  20  21  22  23  24
  25  26  27  28  29  30  31
      END

      expect("#{calendar}").to eq oct
    end
  end

  context 'Jul 2014' do
    it 'prints the calendar' do
      calendar = Calendar.new 2014, 7
      jul =
        <<-END
         July 2014
 Sun Mon Tue Wed Thu Fri Sat
           1   2   3   4   5
   6   7   8   9  10  11  12
  13  14  15  16  17  18  19
  20  21  22  23  24  25  26
  27  28  29  30  31
      END

      expect("#{calendar}").to eq jul
    end
  end

  context 'Aug 2014' do
    it 'prints the calendar' do
      calendar = Calendar.new 2014, 8
      aug =
        <<-END
         August 2014
 Sun Mon Tue Wed Thu Fri Sat
                       1   2
   3   4   5   6   7   8   9
  10  11  12  13  14  15  16
  17  18  19  20  21  22  23
  24  25  26  27  28  29  30
  31
      END

      expect("#{calendar}").to eq aug
    end

    it 'prints the calendar' do
      calendar = Calendar.new 2014, 8, 3
      aug =
        <<-END
         August 2014
 Wed Thu Fri Sat Sun Mon Tue
           1   2   3   4   5
   6   7   8   9  10  11  12
  13  14  15  16  17  18  19
  20  21  22  23  24  25  26
  27  28  29  30  31
      END

      expect("#{calendar}").to eq aug
    end
  end
end

