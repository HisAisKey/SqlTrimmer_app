class Home
  include ActiveModel::Model
  attr_accessor :content, :i, :and_or_on, :c, :re, :j
  validates :content, presence: true

#フォームからの入力をそのまま文字列て獲得
  def make_arr
    if self.content
      self.content.split(" ")
    else
      #エラー処理へ繊維
    end
  end

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


  #整形メソッド
  def trim
    @trimmer = self.make_arr
    @trimmer.map do |str|
      if str == "select"
        str.upcase!
      else
        str
      end
    end 
  end

  def test1
    @test1 = self.make_arr
    @test2 = self.change_word_big
    @test3 = self.change_word_small
    @word = self.re
    if @word == "1"
      @test1.inject(){|a,b| "#{a} #{b}"}
    elsif @word == "2"
      @test2.inject(){|a,b| "#{a} #{b}"}
    elsif @word =="3"  
      @test3.inject(){|a,b| "#{a} #{b}"}
    end
  end



end


