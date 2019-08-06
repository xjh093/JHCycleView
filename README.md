# JHCycleView
简单的轮播图

---

# What
![image](https://github.com/xjh093/JHCycleView/blob/master/image.png)

---

# Usage

```
    JHCycleView *cycleView = [[JHCycleView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 100)
                                                       textData:@[@"第1页",@"第2页",@"第3页",@"第4页"]];
    [self.view addSubview:cycleView];
    
    JHCycleView *cycleView1 = [[JHCycleView alloc] initWithFrame:CGRectMake(0, 220, CGRectGetWidth(self.view.frame), 100)
                                                         urlData:@[@"head1",@"head2",@"head3",@"head4",@"head5"]];
    [self.view addSubview:cycleView1];
```
