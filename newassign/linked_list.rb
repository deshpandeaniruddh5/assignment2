class List_node
  attr_accessor :value, :next
      
  def initialize (value=nil)
    @value = value 
    @next = nil
  end
end 

  class Linked_list
    attr_accessor :head

    def initialize
      @head = nil
    end

    def append(value)
      if @head!=nil
        find_tail.next = List_node.new(value)
      else
        @head = List_node.new(value)
      end
    end

    def find_tail
      node = @head
      return node if !node.next
      return node if !node.next while (node = node.next)
    end 

    def find(value)
      node = @head
      while node!=NULL
        if node.value==value
          return true
        end
      end  
      return false
    end

    def delete(value)
      if @head.value == value
        @head = @head.next
        return
      end
      node=@head
      while node.next
        if node.next.value==value
          node.next=node.next.next
          return
        end
        node=node.next
      end    
    end

    def print
      node = @head
      puts node.value
      while (node = node.next)
        puts node.value
      end
    end
  end