import UIKit

class SiteTableViewController: UITableViewController
{
    private var sites = [
        Site(title:"Royals Sweep Orioles to Advance to World Series", url:"http://www.nytimes.com/2014/10/16/sports/baseball/royals-keep-rolling-and-advance-to-the-world-series.html?hp&action=click&pgtype=Homepage&version=LargeMediaHeadlineSum&module=photo-spot-region&region=top-news&WT.nav=top-news&_r=0"),
        Site(title:"How Not to Be Fooled by Odds", url:"http://www.nytimes.com/2014/10/16/upshot/how-not-to-be-fooled-by-odds.html?hp&action=click&pgtype=Homepage&version=HpSum&module=second-column-region&region=top-news&WT.nav=top-news"),
        Site(title:"Against Rules, Amber Vinson, Dallas Worker With Ebola, Boarded Plane", url:"http://www.nytimes.com/2014/10/16/us/ebola-outbreak-texas.html?hp&action=click&pgtype=Homepage&version=LedeSum&module=first-column-region&region=top-news&WT.nav=top-news")
    ]
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sites.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        if let image = (UIImage(named: "leaf.png")) {
            cell.imageView.image = createMockFavicon(image)
        }
        
        let site = sites[indexPath.row]
        
        cell.textLabel.text = site.title
        cell.textLabel.font = UIFont(name: "FiraSans-SemiBold", size: 13)
        cell.textLabel.textColor = UIColor.darkGrayColor()
        cell.indentationWidth = 20
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let site = sites[indexPath.row]

        let readerController = ReaderViewController(nibName: "ReaderViewController", bundle: nil)
        readerController.urlSpec = site.url
        presentViewController(readerController, animated: true, completion: nil)
    }
}
