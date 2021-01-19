require 'io/console'
require_relative 'class_BST'
require_relative 'class_node'
require_relative 'linked_list'

elements=[]
data_structure=nil
if(ARGV[0])
  file_data = File.read(ARGV[0]).split
  data_structure=file_data.shift.chomp
  for data in file_data
    elements.push(data.to_i)
  end    
end  

while !data_structure
  p "Insert the number to create subsequent data structure:-"
  p "1-BST"
  p "2-LL"
  num=$stdin.gets
  if num.chomp.to_i==1 
    data_structure="BST"
  elsif num.chomp.to_i==2
    data_structure="LL"
  else
    p "Choose correct option"
  end
end    

  if data_structure=="BST"
    p "Preorder Traversal:-"
    p elements
    bst=BST.new
    root=nil
    for element in elements
      root=bst.insert_element(root,element)
    end
    while 1
      command=$stdin.gets
      if(command.chomp=="quit")
        if !ARGV[0]
          p "Enter file name to be created:-"  
          file_name=$stdin.gets
          ftwo=File.open(file_name.chomp, "w")
          ftwo.truncate(0)
        else
          ftwo = File.open(ARGV[0], "w") 
          ftwo.truncate(0)    
        end    
        preorder=[]
        bst.print_preorder(root,preorder)
        ftwo.puts "BST"
        for x in preorder  
          ftwo.puts(x) 
        end
        exit()
      elsif command.chomp=="insert"
        puts 'Enter number to insert:'
        key=$stdin.gets
        root=bst.insert_element(root,key.chomp.to_i)
      elsif command.chomp=="largest"
        puts bst.largest_element(root)
      elsif command.chomp=="smallest"
        puts bst.smallest_element(root)
      elsif command.chomp=="inorder"
        bst.print_inorder(root)
      elsif command.chomp=="preorder"
        bst.print_preorder(root,[]) 
      elsif command.chomp=="postorder"
        bst.print_postorder(root)
      elsif command.chomp=="search"
        puts 'Enter number to search:'
        key=$stdin.gets
        p bst.search_element(root,key.chomp.to_i)
      elsif command.chomp=="printallpaths"
        arr=[]
        bst.print_allPaths(root,arr)
      elsif command.chomp=="delete"
        puts 'Enter number to be deleted:'
        key=$stdin.gets
        root=bst.delete_node(root,key.chomp.to_i)  
      else 
        p "Invalid Command"
      end
    end 
  else
    p "Linked_list traversal:-"
    p elements
    ll=Linked_list.new
    for element in elements
      ll=ll.append(element)
    end

    while 1
      command=$stdin.gets
      if(command.chomp=="quit")
        if !ARGV[0]
          p "Enter file name to be created:-"  
          file_name=$stdin.gets
          ftwo=File.open(file_name.chomp, "w")
          ftwo.truncate(0)
        else
          ftwo = File.open(ARGV[0], "w") 
          ftwo.truncate(0)    
        end    
        node=ll.head
        ll_elements=[]
        while node
          ll_elements.push(node.value)
          node=node.next
        end    
        ftwo.puts "LL"
        for x in ll_elements  
          ftwo.puts(x) 
        end
        exit()
      elsif command.chomp=="insert"
        puts 'Enter number to insert:'
        key=$stdin.gets
        ll.append(key.chomp.to_i)
      elsif command.chomp=="search"
        puts 'Enter number to search:'
        key=$stdin.gets
        p ll.find(key.chomp.to_i)
      elsif command.chomp=="delete"
        puts 'Enter number to be deleted:'
        key=$stdin.gets
        ll.delete(key.chomp.to_i) 
      elsif command.chomp=="print"
        ll.print()   
      else  
        p "Invalid Command"
      end
    end
  end   