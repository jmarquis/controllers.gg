module CompendiumHelper

  def menu_tree(tree, path = '/compendium', indent = 1)
    render 'menu_tree', locals: {
      indent:,
      tree:
    }
  end

  def path_matches?(path, current_path, complete_match: false)
    if complete_match
      Pathname.new(current_path).cleanpath.to_s == Pathname.new(path).cleanpath.to_s
    else
      Pathname.new(current_path).cleanpath.to_s.starts_with? Pathname.new(path).cleanpath.to_s
    end
  end

end
