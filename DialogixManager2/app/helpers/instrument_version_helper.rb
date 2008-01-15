module InstrumentVersionHelper
  
  def instrument_contents_column(record)
    name = record.instrument_contents.size if record.instrument_contents.size > 0
  end
  
  def instrument_sessions_column(record)
    name = record.instrument_sessions.size if record.instrument_sessions.size > 0
  end
  
end
