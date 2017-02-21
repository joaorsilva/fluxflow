        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3><?php echo($this->tag->h3) ?></h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2><?php echo($this->tag->h2) ?></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a href="javascript:void(0);"><i class="fa fa-filter"></i></a>
                      </li>
                      <li><a href="javascript:void(0);"><i class="fa fa-eraser"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-columns"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="javascript:void(0)"><i class="fa fa-eye"></i> Id</a>
                          </li>
                          <li><a href="javascript:void(0)"><i class="fa fa-eye"></i> Name</a>
                          </li>
                          <li><a href="javascript:void(0)"><i class="fa fa-eye-slash"></i> Module</a>
                          </li>
                          <li><a href="javascript:void(0)"><i class="fa fa-eye"></i> Active</a>
                          </li>
                          <li><a href="javascript:void(0)"><i class="fa fa-eye"></i> Deleted</a>
                          </li>
                        </ul>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                        <p>Application controllers are the controllers present in the application secured areas. Controllers must contain actions and belong to modules forming the structure Module, Controller, Action. This is particularly important to set permissions and define the solution structure.</p>
                        <div class="row">
                            <form class="form-horizontal form-label-left">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="page-size" style="max-width:60px;">Records</label>
                                    <div class="col-md-9 col-sm-9 col-xs-12" >
                                    <select id="page-size" name="page_size" class="form-control" style="max-width: 80px;">
                                        <?php for($item = 10; $item <= 100; $item = $item + 10) {?>
                                        <option value="<?php echo($item)?>"><?php echo($item)?></option>
                                        <?php } ?>
                                    </select>
                                    </div>
                                </div>
                            </form>
                      </div>
                      <div class="table-responsive">
                          <table id="table-records" class="table table-striped jambo_table bulk_action">
                                <thead>
                                    <tr class="headings">
                                        <th>
                                            <input type="checkbox" id="check-all" class="flat">
                                        </th>
                                        <th id="col-id"><a href="javascript:void(0);" style="color:#ECF0F1"><span> Id </span><i class="fa fa-sort-amount-asc pull-right" ></i></a></th>
                                        <th id="col-name"><a href="javascript:void(0);" style="color:#ECF0F1"><span> Name </span><i class="fa fa-sort pull-right" ></i></a></th>
                                        <th id="col-app_modules_id"><a href="javascript:void(0);" style="color:#ECF0F1"><span> Module </span><i class="fa fa-sort pull-right" ></i></a></th>
                                        <th id="col-active"><a href="javascript:void(0);" style="color:#ECF0F1"><span> Active </span><i class="fa fa-sort pull-right" ></a></th>
                                        <th id="col-deleted"><a href="javascript:void(0);" style="color:#ECF0F1"><span> Deleted </span><i class="fa fa-sort pull-right" ></a></th>
                                        <th>Operations</th>
                                    </tr>
                              </thead>
                              <tbody>
                              </tbody>
                          </table>
                        </div>
                        <div>
                        <div class="row">
                            <div id="paging-show" class="col-md-4 col-sm-4 col-xs-12">
                                Showing record 1 to 10 of 30 records.
                            </div>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <div class="row pull-right" style="margin-right:0px;">
                                    <div id="paging" class="btn-group">
                                    </div>
                                </div>
                            </div>    
                        </div>
                        </div>    
                    </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div id="javascript-data" class="hidden">
            <span class="javascript-data" data-key="controller-path" data-value="/ff/appcontrollers"></span>
            <span class="javascript-data" data-key="action-path" data-value="/"></span>
        </div>

