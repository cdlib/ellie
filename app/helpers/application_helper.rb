module ApplicationHelper
  
def neweo
  %w[even odd].enum_for(:cycle)
end

SPACECHAR = "\u23B5".freeze
end
