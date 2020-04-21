class Home

  include ActiveModel::Model
  attr_accessor :content, :i, :and_or_on, :c, :re, :j, :output
  validates :content, presence: true

#フォームからの入力をそのまま文字列て獲得
  def make_arr
    self.content.split(" ")
  end

@@double_symbol = %w[<> <= >= || != \\\\]
@@math_symbol = %w[+ * - = / < >]
@@single_symbol = %w[" ? % & ' ( ) | , . : ; !]
@@con_reserve_word = %w[as and between]
@@sp_reserve_word = %w[select from where]
@@etc_reserve_word = %w[by join]
@@reserve_word = ["abs", "absolute", "access", "action", "add", "admin", "after", "aggregate", "alias", "all", "allocate", "alter", "amount", "and", "andnot", "ansi", "any", "are", "array", "as", "asc", "assertion", "assign", "async", "at", "authorization", "auto", "avg", "base", "before", "begin", "between", "binary", "bit", "bit_and_test", "bit_length", "blob", "boolean", "both", "breadth", "btree", "buffer", "by", "byte", "call", "cascade", "cascaded", "case", "cast", "catalog", "change", "char", "character", "char_length", "character_length", "check", "class", "clob", "close", "cluster", "coalesce", "collate", "collation", "column", "columns", "comment", "commit", "completion", "compressed", "condition", "configuration", "connect", "connection", "const", "constraint", "constraints", "constructor", "contiguous", "continue", "convert", "corr", "corresponding", "count", "count_float", "covar_pop", "covar_samp", "create", "cross", "cube", "cume_dist", "curaid", "current", "current_date", "current_default_transform_group", "current_path", "current_roll", "current_time", "current_timestamp", "current_transform_group_for_type", "current_user", "cursor", "cycle", "data", "database", "date", "day", "days", "dba", "deallocate", "dec", "decimal", "declare", "default", "defer", "deferrable", "deferred", "delete", "demoting", "dense_rank", "depth", "deref", "desc", "describe", "description", "descriptor", "destroy", "destructor", "deterministic", "device", "diagnostics", "dictionary", "digits", "direct", "disconnect", "display", "distinct", "do", "domain", "double", "double_precision", "drop", "dynamic", "each", "edit", "else", "elseif", "encrypt", "end", "end-exec", "equals", "escape", "estimated", "every", "except", "exception", "exclusive", "exec", "execute", "exists", "exit", "extern", "external", "extract", "false", "fetch", "file", "filter", "first", "fix", "fixed", "flat", "float", "for", "force", "foreign", "found", "free", "from", "full", "function", "general", "get", "get_java_stored_routine_source", "global", "go", "goto", "grant", "group", "grouping", "handler", "hash", "having", "help", "hex", "host", "hour", "hours", "huge", "identified", "identity", "if", "ignore", "immediate", "in", "index", "indicator", "initialize", "initially", "inner", "inout", "input", "insensitive", "insert", "int", "integer", "intersect", "interval", "into", "is", "isolation", "is_user_contained_in_hds_group", "iterate", "join", "key", "label", "language", "large", "last", "lateral", "leading", "leave", "left", "length", "less", "level", "like", "limit", "lines", "link", "list", "local", "localtime", "localtimestamp", "locator", "lock", "locks", "logid", "logname", "long", "loop", "lower", "map", "match", "max", "maxusages", "mchar", "microsecond", "microseconds", "min", "minute", "minutes", "mod", "mode", "modifies", "modify", "module", "month", "months", "move", "mvarchar", "names", "national", "natural", "nchar", "nclob", "nesting", "new", "next", "no", "none", "nonlocal", "not", "nowait", "null", "nullable", "nullif", "numeric", "nvarchar", "object", "octet_length", "of", "off", "offset", "oid", "old", "on", "only", "open", "operation", "operators", "option", "optimize", "or", "order", "ordinality", "others", "out", "outer", "output", "over", "overflow", "overlaps", "overwrite", "own", "owner", "pad", "page", "parameter", "parameters", "partial", "partition", "partitioned", "path", "pctfree", "pendant", "percent_rank", "percentile_cont", "percentile_disc", "pic", "picture", "position", "postfix", "preallocated", "precision", "preferred", "prefix", "preorder", "prepare", "preserve", "primary", "primleges", "prior", "private", "privileges", "procedure", "program", "protected", "public", "purge", "random", "range", "rank", "rd", "rdarea", "rdnode", "read", "reads", "real", "recompile", "recoverable", "recovery", "recursive", "redo", "ref", "references", "referencing", "reglike", "regr_avgx", "regr_avgy", "regr_count", "regr_intercept", "regr_r2", "regr_slope", "regr_sxx", "regr_sxy", "regr_syy", "relative", "release", "releasing", "rename", "repeat", "reserved", "resignal", "restart", "restrict", "result", "return", "returns", "revoke", "right", "role", "rollback", "rollup", "root", "routine", "row", "row_number", "rowid", "rows", "savepoint", "scale", "scan", "scattered", "schema", "schemas", "scope", "scroll", "sd", "search", "second", "seconds", "section", "segment", "select", "sensitive", "separate", "separator", "sequence", "session", "session_user", "set", "sets", "sflike", "share", "shlike", "short", "sign", "signal", "similar", "size", "slock", "smallflt", "smallint", "some", "space", "specific", "specifictype", "split", "sql", "sql_standard", "sqlcode", "sqlcode_of_last_condition", "sqlcode_type", "sqlcount", "sqlda", "sqlerrm", "sqlerrm_of_last_condition", "sqlerrmc", "sqlerrml", "sqlerror", "sqlexception", "sqlname", "sqlstate", "sqlwarn", "sqlwarning", "start", "state", "statement", "static", "stddev_pop", "stop", "stopping", "structure", "substr", "substring", "sum", "suppress", "synonym", "system_user", "table", "tables", "temporary", "terminate", "test", "text", "than", "then", "there", "time", "timestamp", "timestamp_format", "timezone_hour", "timezone_minute", "to", "trailing", "transaction", "translate", "translation", "treat", "trigger", "trim", "true", "type", "uamt", "ubinbuf", "uchar", "udate", "uhamt", "uhant", "uhdate", "unbounded", "under", "undo", "unify_2000", "union", "unionall", "unique", "unknown", "unlimited", "unlock", "until", "unnest", "update", "upper", "usage", "use", "user", "user_group", "user_level", "using", "utime", "utxtbuf", "value", "values", "var_pop", "var_samp", "varchar", "varchar_format", "variable", "varying", "view", "virtual", "visible", "volatile", "volume", "volumes", "wait", "when", "whenever", "where", "while", "window", "with", "within", "without", "work", "write", "xlike", "xlock", "xml", "xmlagg", "xmlexists", "xmlparse", "xmlquery", "xmlserialize", "year", "years", "zone"]


  def change_word_big
    @chbig = self.make_arr
    @chbig.map do |str|
      if @@reserve_word.include?(str.downcase)
        str.upcase
      else
        str
      end
    end
  end

  def change_word_small
    @chsmall = self.make_arr
    @chsmall.map do |str|
      if @@reserve_word.include?(str.downcase)
        str.downcase
      else
        str
      end
    end
  end


  def word_changee
    @word = self.re
    if @word == "1"
      @wc = self.make_arr
    elsif @word == "2"
      @wc = self.change_word_big
    elsif @word =="3"  
      @wc = self.change_word_small
    end
  end

  def indent
    @indent = self.i
    if @indent == "1"
      "\t"
    elsif @indent == "2"
      "  "
    elsif @indent == "3"
      "    "
    end
  end
  
  def tree
    @tree_arr = self.word_changee
    @sql_tree = []
    @temp_sql_tree = []
    @temp_sql_tree_c = []
    @temp_string = ""

    @tree_arr.each do |x|
binding.pry
      #予約語に含まれてるか
      if @@sp_reserve_word.include?(x.downcase)
        #最終的に格納する配列にすでに存在する場合(skip)
        if @sql_tree.include?(x)
          #temp_c領域が空じゃない場合はtemp_cをtempに移し、temp_cを空にする
          unless @temp_sql_tree_c.empty?
            @temp_sql_tree << @temp_sql_tree_c
            @temp_sql_tree_c = []
          end
          @temp_sql_tree << x
          next
        #temp領域にfrom句があり、temp領域に同じ予約語が存在しない場合(skip)
        elsif @temp_sql_tree.include?("from") || @temp_sql_tree.include?("FROM")
          #temp_c領域が空じゃない場合はtemp_cをtempに移し、temp_cを空にする
          unless @temp_sql_tree_c.empty? 
            unless @temp_sql_tree.include?(x)
              @temp_sql_tree << @temp_sql_tree_c
              @temp_sql_tree_c = []
              @temp_sql_tree << x
              next
            end
          end
        end 
        #temp領域が空じゃない場合はtempを最終格納先に移し、tempを空にする
        unless @temp_sql_tree.empty?
          @temp_sql_tree << @temp_sql_tree_c
          @temp_sql_tree_c = []
          @sql_tree << @temp_sql_tree
          @temp_sql_tree = []
        end
        #予約語を配列に、skipがコメントの箇所を通らなかった場合のみ
        @sql_tree << x
      elsif x == "(" || x == ")"
        @temp_sql_tree << x  
      elsif x == ";"
        unless @temp_sql_tree.empty?
          @temp_sql_tree << @temp_sql_tree_c
          @temp_sql_tree_c = []
          @sql_tree << @temp_sql_tree
          @temp_sql_tree = []
        end
        @sql_tree << x
      else
        #SQL予約語が@temp配列の最後の要素の場合
        unless @temp_sql_tree.empty? 
          if @@sp_reserve_word.include?(@temp_sql_tree.last.downcase)
            @temp_sql_tree_c << x
            next
          end
        end
        @temp_sql_tree << x
      end
    end
    return @sql_tree
  end


  def tree_2
    @tree_arr = self.word_changee
    @sql_tree = []
    num = 0
    already_in = ""
    layer = 0

    @tree_arr.each do |x|
      # xを配列化
      # 「ルール」
      #-----------------------------------------------------
      # 配列として扱う場合      ＝＞ x
      # 値として扱う場合　      ＝＞ x[0]
      #-----------------------------------------------------
      
      #-----------------------------------------------------
      # 新しく階層を追加　　　　＝＞ @sql_tree << x
      # 既存の階層に階層を追加　＝＞ @sql_tree[-1] << x 
      # 新しく値を追加　　　　　＝＞ @sql_tree << x[0]
      # 既存の階層に値を追加　　＝＞ @sql_tree[-1] << x[0]
      #----------------------------------------------------
      
      x = [x]
#binding.pry
      #予約語に含まれてるか
      if @@sp_reserve_word.include?(x[0].downcase)
        if @sql_tree.include?(x[0])
          @sql_tree[-1] << x
          num += 1
          next
        else  
          unless @sql_tree.empty?
            if @sql_tree[-1].flatten.include?("from") || @sql_tree[-1].flatten.include?("FROM")
              if already_in.include?(x[0])
                @sql_tree << x[0]
                num += 1
                next
              end
              @sql_tree[-1] << x
              num += 1
              already_in = x
              next
            end
          end
          @sql_tree << x[0]
        end
      else
        if @@single_symbol.include?(x[0])
          case x[0]
          when ";"
            @sql_tree << x[0]
          when "(" 
            @sql_tree << x
          when ")"
            @sql_tree << x
          end
        elsif @@sp_reserve_word.include?(@tree_arr[num - 1].downcase)
          layer = how_many_depth(@sql_tree, 1)
          case layer
          when 1
            @sql_tree << x
          when 2
            @sql_tree[-1][-1] << x
          when 3
            @sql_tree[-1][-1][-1] << x
          when 4
            @sql_tree[-1][-1][-1][-1] << x
          when 5
            @sql_tree[-1][-1][-1][-1][-1] << x
          end
        else
          layer = how_many_depth(@sql_tree, 1)
          case layer
          when 1
            @sql_tree[-1] << x[0]
          when 2
            @sql_tree[-1][-1] << x[0]
          when 3
            @sql_tree[-1][-1][-1] << x[0]
          when 4
            @sql_tree[-1][-1][-1][-1] << x[0]
          when 5
            @sql_tree[-1][-1][-1][-1][-1] << x[0]
          end
        end
      end
    num += 1
    end
    return @sql_tree
  end

  def how_many_depth(array, d)
    arr = array[-1]
    if arr[-1].class == String
      return d
    end
    if arr[-1].class == Array
      how_many_depth(arr, d + 1)
    end
  end

  def plus_indent(sql, depth)
    ii = 0
    sql.each do |x|
#binding.pry
      if sql[ii].class.to_s == "String"
        @@plus_indent_sql << "#{indent * depth}#{x}\r\n"
        #puts depth
      elsif sql[ii].class.to_s == "Array"
        plus_indent(sql[ii], depth + 1)
      end
      ii += 1
    end
    return @@plus_indent_sql
  end

  def result
    @@plus_indent_sql = ""
    @result = self.tree_2
    plus_indent(@result,0)
  end

end
